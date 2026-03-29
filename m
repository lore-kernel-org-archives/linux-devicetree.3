Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8EA37DEBA
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774802393; cv=none; b=XRimgxcjtl5VyZB/V9LgAbQhdwXW7b0msooZo+Am2PLjNPtRepBCgyFN7ZXbMlMNfNM/nCjWRkQx2LdWebWDoJQTjPk5yq71IodzM54q0Sig/hSPOTcit3hViE1a8I6gWq0xBHxORK14Kvt7AV2xsUtekyueHChvQ1oqWMvoHKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774802393; c=relaxed/simple;
	bh=dObbv6mDsOT34Ms3KPDPbr6ZpQuDUkJtd54dwYVsmCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzUOJFZUMAOILcRlNnbFWkH7jna6lmDnDstaZLZwCp1Yd2By3vtvHuHTjdLY2IU8orfYb93OauWWPqNX7jRrkfr65TaVtb35wPxeJkTRC6Wd2KRxmia9VMHmvYULQ57YOtquCgPLUf8N61Js4ZedyRBZLofNlVdrNLbe5GOXdeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xdcini/3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etjwcViS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xdcini/3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etjwcViS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TC198R048833
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mh7aUXuXchRggKvsSjEv7/S8oaTTDbi/oTXU3GGuAhc=; b=Xdcini/3LdKit04k
	3nBR7TkI5QvIjZ2iRqiIEHRTWzfx/8r3387SvYzIX2u4/n4TMcJyi1jnmkdF/KWL
	/+FDnXp7Yl6hi7tIsYGrK9cyVK60zNwDYbbWp0dUIYsHfln9bWC0BQoip3oztQz9
	YI0Gjn3djGuhm9AObgcWnx0UsFZuP6DIyJNdbto4uKlF+3oMDHJV/iXOhwY5j+tF
	loVnXimGb44gZft9gsXfnWUcWZG5pTCG8HpToGm4XTJLVTBT0o71UXfoWwia5MVx
	GL3rE4oUZCBrnqzlDgQKiZgry3EZgbYM4ajWj3+BwBbVw1I1NhLGAD1B9dI4xWMb
	vy1Cyg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d677136g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 16:39:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50917996cfaso67080581cf.0
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774802391; x=1775407191; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mh7aUXuXchRggKvsSjEv7/S8oaTTDbi/oTXU3GGuAhc=;
        b=etjwcViSTXUXGtyBmDJtYG5r/mkgyS+LsULoHJfG1EF3ZuNd108v95Mffr9rSv8Jf+
         TwMoDUqI0QU9hUGiXRS/R180VaKgihR+EnJNVvA9nsj68CPPzVsZ0VbuxXIovGUd5fPz
         vul2QclidUwltBOGcRTM5KEniD5EthqK4x8SW3IDpZiuOmW0rHEuroYkPCJ5RpLvVAoX
         Cwtf7ZNZAFGgrsl6pWYuC7faJwDwr2G7vURBX2oLzB4L4CNWBkYvnkWGk+DsueI8U0DG
         N/SzZlsDluIhWsvWwg0QzaUTCFBer8z1/ao2R3RZ5m8NyDfoTLSFrcGlficnShoI2mMt
         DrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774802391; x=1775407191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mh7aUXuXchRggKvsSjEv7/S8oaTTDbi/oTXU3GGuAhc=;
        b=D0qVJ7rp17b2msY5r1ikwz+y0zY30NQZQb5Ki8OAMJv8TJshrA9DhoroSkM56geY3T
         HlHWJrlOSsz+Xa5hvIBemFF+3oj1QdmSzs5ZrjJQ6QLr1avg3sepj37UIDg/TNKSQ8wM
         pNHU3d8iPpVUpcm6sr74QdDsedxd2dGpeQkraB9zRc4UU+8SoZCxHK2oKF9TCCzOvyCT
         HHTG6wFrMtGwRQYVhLNAleDKwKOI5h68eucHYTAj4Rjw78LXD9soxAWVv5Qnx76PCFj4
         +W81m04A3rrupgGxgpd1vc8XXHjLFTqYdiGwzkkJYbrp3GbH5GtuSNtKcsjRWppweebh
         tytw==
X-Forwarded-Encrypted: i=1; AJvYcCUc73MUcGB12azcrQjSOG6B/t0iNheQJOsf1ra/AUUCLWqVlWitvx7DUXuRaJ9d1dgEufAykdlKzX+L@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd/iWrKPIc3Hium2B4+YNDCI33sI8U8QxBv5KTmIH2lnKEMLrJ
	Gi0cQJcs8ZvApcyQH94YxHfIBSPHy7z0LjAYB3ybYVYP+7wt0XjaEu1Lir9aHhRVMdKbkGmQ+Dr
	85GoX64SG34Bp37PaHtsd07N/BxaukXJmvjWoHdIhyW4YI7Fop7FRDn3LmAijjlXY
X-Gm-Gg: ATEYQzxbVFdmM80og8T2vGXF7BU7yTkjbKj0wg+j4i7r69Cn5I6WvSse1EOfc5ikSkv
	vnEUjpWg45v6sMB3fzbT0rUwV6izPNYoCMuXj9zpWgzM5VNJQw1IYvrqNdqc1rzoE+lj74mSoPS
	aWEq1PwcnK1XSljtH2edk/DSsHbi6Uorm6KRGZy07UhR83dlGpWKFPx1J/HL9JTxtiWORhNMNpD
	sdoRzO+orAkoNXHnARBlqG1f7k4xk5jB6j3Fs/0wHvq1T3uwhCjwT4NFsOJexzNvlvw41uczyHd
	22xmikVuKLd32QKA3ZYFe9UOd2IygPA5qFKrDf2azJqBM3P0bArOWHXC5OC81ksW3NYiaxD8JBF
	7auVkcujo9DQKNvXO2WqagwxEqQ5yePAKZwf0eaRcnfAphjQanZwD+N4E/guYUGG1qqjc6hVQY2
	H93RlSmHb2NP7PWgTLZG/Y2HiR73ojPgLe4mU=
X-Received: by 2002:a05:622a:4015:b0:509:1579:7c3b with SMTP id d75a77b69052e-50ba390216fmr138562151cf.51.1774802390992;
        Sun, 29 Mar 2026 09:39:50 -0700 (PDT)
X-Received: by 2002:a05:622a:4015:b0:509:1579:7c3b with SMTP id d75a77b69052e-50ba390216fmr138561891cf.51.1774802390503;
        Sun, 29 Mar 2026 09:39:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83890b55sm10105951fa.27.2026.03.29.09.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:39:49 -0700 (PDT)
Date: Sun, 29 Mar 2026 19:39:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/1] dt-bindings: connector: Add =?utf-8?Q?role?=
 =?utf-8?B?4oCRc3dpdGNo?= provider phandle
Message-ID: <usxh6vop6bafzqutu5x3xb2mzrd3bthzmustufmojlqxhwu33v@ea7v24iadvd4>
References: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
 <CAO9ioeUhkwCPsjS4Pm5DKHZdQjLxvfy=fkcJfbF2hsgq9Ljqww@mail.gmail.com>
 <28c9c2b5-feeb-49ae-9d4c-51ac571ad8a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28c9c2b5-feeb-49ae-9d4c-51ac571ad8a1@oss.qualcomm.com>
X-Proofpoint-GUID: 4neQtK1FQPQBvOyqKUpOiHbaww5Mq2DO
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69c955d8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iFA7ombHHFLmFrjagE4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 4neQtK1FQPQBvOyqKUpOiHbaww5Mq2DO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEyOSBTYWx0ZWRfX9hIcscxsNIC9
 EK9Iii6me7Q16Rd/VASrsBV3nHkgRkcy34Nuov7ychqFjV0aExrKlcKFn7ru8JqkAWb584vPPJE
 lq6OTWXM7KExQffeOSqOKTkA3Xf93Wxp5PvfzWubGH8B+Kxyvm22f+dDwgcftsQ/QwwS3RiEZl2
 hDZViQIoZnUf1ARsKoYYIWGLDsgVcyQ0zl+LyvBiYiJ5JhdJ6TcQooecUlQYMlYY+5SU/bcoNVY
 tWtKd0cb1PnbDgY9jmBo55ZfNG3v+Cz5XvzJly+UZraPmBIL+c5FLRqbKs7dg07wVCE0YcJIBdf
 bCvsjsEvECwYH+EWrM6W/ROTW8Y4wnYKHRZXuVUbXkmw00xc8vnTBUCxqK9kvLGznZByQ8qeZJR
 x25wQKYZSANBq1Lk8k1iXwcCUrxGxmS67eZ5SnRvNDPXHCQ1XDB3SVY1FzzslCy69pO8NSV9eep
 KVYHa0OB8JXnAnsBtUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603290129

On Wed, Mar 25, 2026 at 06:44:35PM -0700, Elson Serrao wrote:
> 
> 
> On 3/24/2026 10:46 AM, Dmitry Baryshkov wrote:
> > Hello,
> > 
> > On Tue, 24 Mar 2026 at 19:29, Elson Serrao
> > <elson.serrao@oss.qualcomm.com> wrote:
> >>
> >> Hi all,
> >>
> >> This patch proposes a generic Devicetree mechanism for a USB connector to
> >> reference the USB role‑switch provider when there is an intermediate,
> >> block between the connector and the controller in the OF graph.
> > 
> > Please, don't describe what the patch or the change does, see
> > Documentation/processes/submitting-patches.rst.
> > 
> >>
> >> Problem
> >> =======
> >> OF‑graph links are strictly point‑to‑point via remote-endpoint, so a
> >> consumer can only discover its immediate neighbor in the graph. When an
> >> intermediate node sits between the USB connector and the controller, the
> >> connector cannot identify the controller (the role‑switch provider) from
> >> the graph alone.
> > 
> > DT is a hardware description. Here you are trying to describe the
> > software behaviour. Please don't mix those.
> > 
> > [skipped diagrams]
> > 
> >>
> >> From the OF‑graph structure alone, Conn‑0 cannot determine that
> >> USBCtrl‑0 (and not USBCtrl‑1) is the correct role‑switch provider.
> >>
> >> Proposal
> >> ========
> >> Add an optional consumer→provider phandle on the connector:
> >>
> >>     usb-role-switch = <&controller>;
> > 
> > An alternative proposal: let EUD register as a role-switch and then
> > retranslate usb-role-switch events. This is how it is handled by the
> > Type-C-related objects (muxes and orientation switches).
> > 
> 
> Hi Dmitry,
> 
> Thank you for the review and suggestions.
> 
> To better understand the intended model: are you proposing that the EUD
> register a separate usb‑role‑switch instance per connector → controller
> relationship, or a single role‑switch instance representing the EUD as a
> whole?
> 
> I understand the analogy with Type‑C muxes and orientation switches, which
> are typically modeled on a per‑connector basis. In contrast, the EUD hardware
> block spans multiple connectors and controllers and can carry traffic from
> multiple independent USB connections concurrently.
> For example:
>   - Connector0 operating in host mode (connected to Controller0)
>   - Connector1 operating in device mode (connected to Controller1)
>   - Both active at the same time
> 
> In such a scenario, a single role‑switch instance representing both
> connectors appears ambiguous, as different roles may be active
> simultaneously on different ports.
> 
> Registering multiple role‑switch instances—one per connector/controller
> pair—would avoid that ambiguity. However, this would imply a single EUD
> device registering multiple role‑switch instances associated with the same
> firmware node. As the USB role‑switch framework currently assumes a 1:1
> relationship between a firmware node and its role‑switch instance, this
> would likely require non‑trivial changes to USB role switch framework on
> how role‑switch instances are represented and managed.

It assumes 1:1 between some fwnode and the role-switch. But nothing
implies that it is the device node. It is the parent of the
corresponding OF graph. If EUD has two graphs, then each graph can have
its own usb-role-switch.

-- 
With best wishes
Dmitry
