Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1D93CBE88
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 11:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778931193; cv=none; b=rlZZn7ST1k78z1+t/y2xnWcrph1jLv/TnDiXUpViyCNV9wFzJvFJwPs1Hp8vmCrtWSrkP4MvnGFLxefqh/fCpZ6gAFgh1WpcaEeV32f5jNHBObVXcuMQreFTDFeEUCUQgYvPU5K6v97aM+phnXcvquHtqsrMvP7CRDnYnzUiNsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778931193; c=relaxed/simple;
	bh=c7/fDj5CZMFkOVW3HG3dTmdxHSOCpcjlJvRGLHkPh8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8a2ABmXrxahtaOSYyIPHJM9HQZpSyF7wxQNEoXJA/iB4rW2YnzVFSWQyykQ8NIsrv9Qx+HrqmFGrdWpyEFa57h6WatfkhdzI+DeLRy2TIwab+vSV7pZ6CTx0z3Xunr0ZE/Us6+wvcsVtlYG57gAwFjXPhiM/eTKAYzM31dl4Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRlcbz91; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9hyGOJI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRlcbz91";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c9hyGOJI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3mnKT3269257
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 11:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AX0tFwqRt6TBvJg8bQIFay/r
	t7O2EG7am9/QJOwChb4=; b=CRlcbz91/iKdUsgMnyzGyZj9OJRH+LVvvoZbkIv/
	BgkZl07f9Gat9vz7f9dsPT2eMI0yxl0UQTxoxRYQ4nTIy9s68A9KFItT7sS7WaIH
	gLofVoWHQ09vTICB1qwrXlqrKQ8Tf2Hkl7MRsH/HJahiSZoPhqhvrlj8akE+YzIe
	0D6Ewn1q4gZ1t2DhOMxhFub+M7AXCLn4JLxz3Bl++g1QMiD+vVehJ+ZnyRDAT4UD
	o2hF5bZgyIZ9ndPPjf8EbSkt2hvzkmUVTX6VnT3L0WY6WAbPX+rSc7AGiG5K3AAZ
	h3PccZU/WZQ4QyMgZS4CqGEn+cOYyxqsv98dQBEYXJyQCA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g0r3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 11:33:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516458449d4so28503871cf.1
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 04:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778931189; x=1779535989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AX0tFwqRt6TBvJg8bQIFay/rt7O2EG7am9/QJOwChb4=;
        b=c9hyGOJI0wdzmZSuX6fUjVlPZj/U2MexXZMt7YrFVs091XM+IcO1iOKxHvQ+LDEv4V
         flFbetUAZzJGGVNjZnpEA8agQcAhM9kfwtYRRII/8lZD2xHaqliAMuDVks0ptU/t3ajZ
         4Ayc0PPi1PNONH/knX+8GGccHM1WpARKVo3SofwEcDafpaHKMm+JC/ZwUKrNYdKiej29
         N/DgOyAVDEpUWHi7BvZkPYIwbsgkQfOMiWoCg1OXH1Mws17w5qjJDbW8Y4wSCeZvPcAT
         X2LTTZHAeW53b0xn2IHVV+Bvd9Az8Ta+RLcVHnvDWt+YuUmKLy17fhjkrD41YYm4TtmA
         MTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778931189; x=1779535989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AX0tFwqRt6TBvJg8bQIFay/rt7O2EG7am9/QJOwChb4=;
        b=rKnE556dR8kRimVDpTTxVzW8ojn6w5u0qDYNik3gZ/DweP+tKdGX/HdHal83+KXv/a
         fR6AY96j5U2vVItynXkq/AoZEWi2O7P23AnwsSh9A61Rf5V9Q8jFPVBX2QpWiRwnrbeo
         jI/hg8Qf0cwwq27eaqtM/02N2PwBDD3DUWGY6U3m4Ri5GJqQZ4I46vHowIQIYqSzFquG
         QRF3jitk45zx8kS1o8FuX8+OsJzuaxQqbtxLCau9Rna6Q3W1kT2wx5tgJPY3Q1ZH2mXB
         81Ybl9AfLBU1qaOVyzlSO8YJH3ZkS3t4cnf+m8vTvtiIo9Gl+iTBois+h/mNhEjYt60M
         Bhtw==
X-Forwarded-Encrypted: i=1; AFNElJ8bParMd3K5sCmd88rDLRCaLNfxo2+te7yQhxwEjq3vsYJSBWObnaD3B/nKV3yy685823V5gP5/O3we@vger.kernel.org
X-Gm-Message-State: AOJu0YwmsyU7vWq9iKKUxZMKZX6RyjsPnbrfRgUiCvnJUu6X4zKeuE4U
	rPDDQYrh4rClTq+KkBeLHQaWIvRnDkLdkcYYvkrssFuy5uUJ+ynl7BehB1tTzcbv/pyZknW26Nr
	2XiPY44Ly4KIBtQaYkho2snpWttOHlGK0xBVXxdgCV+lUvxxijIA2jhP62PHdCoG1
X-Gm-Gg: Acq92OHQ4qad/EiS+AD29wPKXO+MTTVzHy0aXc6+b2GJxZVJvQ2ZM8eIV7GF9sJjNTw
	A6d9CZIiwOEY84EsmdeZ9evuhbvvl8OVyrGyZbX3zq+2WsVkq+l2yRvlI8Sap+6m9ybFsxjo3Aa
	HLHPFib5jPS61k7rbFPcvYf1xDqz5nOqXTMEvfsTUrN4dBFa+hpMf3V65/3lVCXVzCXwCzjNxW7
	BWwwKvjeFiceG1bG5nI6JIOkZuMue6vzSDn/bwXQzBjk6DRKajHVaZ0RyTZKGdkcwTe31XXhO61
	nljWd9eyVrXCgjRQKuxsYp+4RweXXgPsN+Lr+zI93cU69MSw0tBc/18XGkERTJe/WRpTbuvbDCS
	l3ChrtXeLIbXzALhuX6satiK5/JlMIy/udSA=
X-Received: by 2002:a05:622a:6201:b0:50f:817c:2fe6 with SMTP id d75a77b69052e-51659fe0269mr114688141cf.2.1778931189045;
        Sat, 16 May 2026 04:33:09 -0700 (PDT)
X-Received: by 2002:a05:622a:6201:b0:50f:817c:2fe6 with SMTP id d75a77b69052e-51659fe0269mr114687691cf.2.1778931188376;
        Sat, 16 May 2026 04:33:08 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm23351835f8f.10.2026.05.16.04.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:33:07 -0700 (PDT)
Date: Sat, 16 May 2026 14:33:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK
 boards
Message-ID: <phulow5tpsgjhbioqcokrzwezlx6rlxc6ymmg6wlj43ucxektu@p7swwathtoqq>
References: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
 <20260516-vivacious-axolotl-of-attack-4e0ad7@quoll>
 <if7u76ecucdpjff7v5a5nryb3oiyouofn4ldpu6dmfweg5tjmh@gxdvexjrazvh>
 <d946b45b-cef0-43a2-b31c-a3860836745e@kernel.org>
 <igtojkmahfoubhkbv2dn4c6h2fzu24patv5n6etjdw3jsy7wss@2qbxzsxg7ph5>
 <d15f75f2-01a8-4bd2-ad12-ee67c93c74d1@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d15f75f2-01a8-4bd2-ad12-ee67c93c74d1@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDExMyBTYWx0ZWRfX0h8+GLB+l4AE
 WFY4AUm9vPgIrT12YYDn+/lCU95qYkPP77WZEyQQlMlX0YblR09XjuWfV8lxPgGJTD8EVzf6gGf
 O7n7o+xziNYaLl0YdQhJF6ncEiz/JQ7rGED/Ip90v1L+ON286dTE6dheinQhR5qg+CTOia/yX2Q
 2VBfAHgOcm6u/1BB6b06EToslORGPEUf1bu4XImwza5ARs4Qp3yWnQZue536a1trraI1I3jqjMv
 GnjDOivLskQ9BgvJ/8POKnpuxYk9/sWAJz/0Rc9vr1UpLPBQmp0APmkLV5WBVEU7Vt1di/Pz6WK
 pMMty/S3V8xE47iaz5dnNdGYYgoO4KT+hkNap9ZFXGIynQ7wXhMczkDxrsBjXIDB7Gh5zkNysNg
 i2NLLfZAvB5j/R6pjOWROUStUU9ZmFwmdvoW0IqwTVqpwlu9VtANPsjTNqkmvKOnxqu52tu23fs
 oNQgzdyZuL2Q9FXfiAg==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0855f6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e9gZUEpOi7332uh5qvgA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: HSx4WvtBUyUnPQDq_PW_xi9rzWfNMObY
X-Proofpoint-ORIG-GUID: HSx4WvtBUyUnPQDq_PW_xi9rzWfNMObY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160113

On 26-05-16 13:22:19, Krzysztof Kozlowski wrote:
> On 16/05/2026 13:12, Abel Vesa wrote:
> > On 26-05-16 12:37:03, Krzysztof Kozlowski wrote:
> >> On 16/05/2026 12:34, Abel Vesa wrote:
> >>> On 26-05-16 11:59:37, Krzysztof Kozlowski wrote:
> >>>> On Fri, May 15, 2026 at 02:13:31PM +0300, Abel Vesa wrote:
> >>>>> Document the compatible strings for the Qualcomm Eliza CQM and CQS EVK
> >>>>> boards. Both boards are built from a base board paired with a SoM which
> >>>>> is populated with either CQ7790M or CQ7790S (Eliza variants), PMICs,
> >>>>> LPDDR, eMMC and UFS.
> >>>>>
> >>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
> >>>>>  1 file changed, 2 insertions(+)
> >>>>
> >>>> Heh, I noticed only after sending email - where is any user of that?
> >>>>
> >>>> I expressed it many times - we do not take bindings without users.
> >>>
> >>> Well, my intention for the DT patchset was to include the eliza-cqm-som.dtsi
> >>> and eliza-cqm-ek.dts as well, basically having the eliza-cqm-som.dtsi
> >>> include the eliza-cqs-som.dtsi and later on add the modem (and the rest
> >>> of the CQM) in there.
> >>>
> >>> But then, I realized that I don't know exactly the differences between
> >>> CQM and CQS, specifically the SoM related ones.
> >>>
> >>> So I decided to send without the CQM entirely.
> >>
> >> But it is not about CQM. There is no user of any of these - neither CQS
> >> nor CQM.
> > 
> > I'm not sure I understand this one. Here is the CQS user:
> > https://lore.kernel.org/all/20260515-eliza-dts-qcs-evk-v1-2-7169d78a33e1@oss.qualcomm.com/
> 
> Why is that posted separately? This breaks every practice we had,
> including all my recent comments complains on internal chats and in
> public to Nord, Shikra and IPQ upstreaming about grouping patches. :/

Yeah, my bad. It should've been sent together with the DT.

Will include it there when respinning that patchset.

Sorry for the mess.
