Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3909A40B379
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098972; cv=none; b=mNZOTYRM9IEYqpyq0wn5X1APcH/J0eb4xWlgZi95fiBO5lWC5g6Yp9L0a7fTqIWsaBp/yyPuW5+PVQDPeNJv/vsJsB4hF+wNbI0+RhIN78YJdW88h3DVDwRKXzkhUdKeuOt7/A7jDRrl5Q1NxpomK06Fk0p+eORHjg1LYiAu7Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098972; c=relaxed/simple;
	bh=c8ISxDyfYFd1w5V9y3jPjVnvxApMDRuA644CwzX2/xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csjOWQTN8sOnlIi5P3QSeHQMgG0FAOqF1hwABQTwTJ1/QIAlxPCGJsBG+ZGSjvStuK63wuigI3ZZv4W8etHu6ET1j8YsSFYJMUx7TFiYuOPUirqnYDsBGjcWBDlL0DGArfq5leUhBPQfyHWROcUipSmZF+VNTxzdwih2afSaHfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neXsZo1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vz6RWsPJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neXsZo1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vz6RWsPJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBtKm1169916
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7cw9iU6/+9ipC9Le/D44AKlV
	MjTt/IKZwjG7uxs0FvI=; b=neXsZo1KP+a3Nf60THwlHRvRrbZn9IdlC3Paea4a
	rNUmOqZfbIvw2LpxG1ZtxowvldG8W7CT604ERYio5xihbms2JQdhPnlXsf4TO3t2
	BcMsSkpw8I+XWSsantCnM6faVrni/hN+Qc/kMLQtssJNlYKt8I3IpfwhYa9j2Xb3
	D+ONTdJVoP3UASbQDwv7NkUX+UMVWGhyFdjxMyf5BzGoyU1h3GGIkoApd85ytgCy
	DF5AlY0XqP9Sy33d/IgoA6hfwMpIf1w5sYhcbNiIN4rrs3jH1jN8GatOcXnKbWe4
	oqryT/RQ+HtH6+wFuHbtA401Q5HzT8R3VsXUqkPdG7Isog==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1s1yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:42:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c5794db0eeso7310322137.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098969; x=1781703769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7cw9iU6/+9ipC9Le/D44AKlVMjTt/IKZwjG7uxs0FvI=;
        b=Vz6RWsPJ3jCuDHOA44NGyfyEinXqaBD4CGv2qx7XU2ioImvCgAib2V0ZlswPHBX7t0
         kFPHLEZ4LlZoFhhYk3eCzgVfB9zebVGQLs43n9+dzYzGlZS4pwIv7ccvcENIhvK06Wve
         Wtox3HymcVr/iN1ad7Nxvi0e4FqVO+kZnoMXU3RyEEw98bqhEnBlzhRHOlO8B7cNmzHc
         TBCfqEVhsygMeF/4+f4CiMtcdHz9zQiGysqFWOLhMDYVk5x4kRLbPZlVSIwMBazMk+dz
         ou3rUODc1q6SRgjRkjhs9PkzxTX8DtWFkTMZZ+tzwBkepISUEnM/451DrpzFHO0YkwYf
         iBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098969; x=1781703769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cw9iU6/+9ipC9Le/D44AKlVMjTt/IKZwjG7uxs0FvI=;
        b=sEQnnz/B9z5EQJO1C+buDZ1Vktc1F+/hRRWurULHzptSxgOLAVaTbxzbjzi09uTy4Y
         J8DBOFrQop/NEBOnap7t2eZVUnWYbhup45fR6sDqENRe+uYnuWdSOqkkUumYCsM5juB0
         YQEQVU5ClC9LztY8rqrRUNfDAZ9ZBXms+sAYxBanvk/PUvIzgrhlJgXPMB7Tq2UaQEX9
         Mpsy26YvPXB27gLXKysaCzGzRMV8GT1vTaag9zWypWeTcXV1OhD9cM8+chlExht0n1XV
         kIlGi5oZqvS4oKMgZYEePIv1+MBzMc0/3ipJ0tHFjiQCHR1I81RLMF8DRT+hWGYblwaJ
         xg4A==
X-Forwarded-Encrypted: i=1; AFNElJ+HHvTUXb6uccS5hEBBJsUdvXZD0Z5Ve+3tPeFt2kH5NtVkI0kBKGYphWiZQPKH0Tm0CAhpza4Qknli@vger.kernel.org
X-Gm-Message-State: AOJu0YzauhmIR5cJAnbAFOLks8kW5y9su4kHQGH+LaGMxa8MNAd1yIMB
	IihPmrYvwbfDOBXUhrP2zEZ7Rq5yOoaSKzJ3BAA9gxG7gTmJ/ytCgPsDNm+PWGPckhD3K4L+UEo
	cHNGdERAcas0nrcp6SVkpw3gU2PAz249sRzeYdT6PDd5leSIMcF17prGYHL1qQE6x
X-Gm-Gg: Acq92OEhBZpIsa6DR+lMcm1krCsnhShRGlww1lPZQ/Vms7blSJrWkKsi57azzU4RJhf
	fB/kTwT9j9+zNkVXU1fglWHSMv9YDCSkbjX/tzmtCp6E2RX4DBgqRr14dUTOfBBs1z78hA15AKt
	Gz8WHFLmMdcZOqz1S8KoGYod/tnuKgELsbLmLHX3j3O/pLXTTGfOHz31CwIrMJQBqz/Wt5xcR1q
	00XK8A/qubiioxucROBrgUm90Dbk4rphaVuPQeJyNa5ppF31S6Nd8jpXwNZ6wu9hjPXJxRaaePo
	wlzm5gYgo+5qhTXRahVqX8cLumhwyayI2YX0LQYxBlKrHmAXB7ezd0JN2rzE930tKgDiBuYHmhG
	aqdSozw8AHJqvqw44ZxQAMNoQSH6ZBDhSKe1vg1XQ7slh9AsPj9Uoc9qkqWm/d+6uoiVQMHRJzE
	jgwb9Dkctxv4QEY1KUAZzGafolZYrUp0uMlEJ/Om4fgZd4RQ==
X-Received: by 2002:a05:6102:441a:b0:631:4580:6a33 with SMTP id ada2fe7eead31-6fefa60c038mr14992243137.21.1781098969422;
        Wed, 10 Jun 2026 06:42:49 -0700 (PDT)
X-Received: by 2002:a05:6102:441a:b0:631:4580:6a33 with SMTP id ada2fe7eead31-6fefa60c038mr14992212137.21.1781098969034;
        Wed, 10 Jun 2026 06:42:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8edf4fsm5429249e87.16.2026.06.10.06.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:42:47 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:42:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH v3 2/8] soc: qcom: Add support for QMI TMD cooling devices
Message-ID: <awmoxzmrgqzot5yfwpoml2olntpultuguuvdfvk5mt2lxqjxqj@n3tsmix64fdb>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-2-291a2ff4c634@oss.qualcomm.com>
 <pyt62qpa75nzdatp5xl7vcqrdzmrzsf5ethw6wq62bzg6b7qtv@ts2v53im4bos>
 <33fe758a-a733-4f27-8824-3dff398e1cd3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33fe758a-a733-4f27-8824-3dff398e1cd3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ZeilcYxov0e6ZTRLgUFSkPQg27ui6XRT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX7gEUNEgBJUdd
 +Xc9dGZlZ1g4iMsPmT+WPhzngaSi66pzYpPTGRm+CAy/7EpILTMWUIMKeL8Ugc/PDvk70SWc4Ec
 mZlEjtZaY1y87aB4MSQOmUPr16ibHiMFqIXaHSxO5jmn3x5qPwxhHtJjw+DZENU/Q0E96o5dNNF
 baFQcgOBwW+Ni+M96mO8kGg0PP4DO6XnkPfqTLOUigMDvRgRlQL0ME625SdBTFUW1jNPUG0CPRA
 EFQlTEX2SrdX9kaqQXixhURKXFA8nU9lblBvkv9hZWrwkv98kA+5ax6WYQgpQu7qjxIhilE75lO
 lUedPRxgpbq1k0wwgYk3GCzHVnNrZLHmb9Jfsc+0vRTDRZYoNDdRJtTcRO+qpqhD/gXoK02pi6Q
 x1n/Ec5XkbnIgb59Na6Q2XWKP1/dnb2y+fG7AAYCdFVkg/ZqcUwweqWbVdy+atS5U1DiiP8Xi7Z
 zuXJDucdCv/lD/xm0Vg==
X-Proofpoint-GUID: ZeilcYxov0e6ZTRLgUFSkPQg27ui6XRT
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a2969da cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=OdyHppD39TW5BxundB8A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100131

On Tue, Jun 09, 2026 at 02:08:57PM +0200, Daniel Lezcano wrote:
> On 6/9/26 13:30, Dmitry Baryshkov wrote:
> > On Tue, Jun 09, 2026 at 03:52:57PM +0530, Gaurav Kohli wrote:
> > > From: Casey Connolly <casey.connolly@linaro.org>
> > > 
> > > Add a Qualcomm QMI Thermal Mitigation Device (TMD) to support thermal
> > > cooling devices backed by remote subsystems.
> > > 
> > > On several Qualcomm platforms, remote processors (for example modem and
> > > CDSP) expose thermal mitigation controls through the TMD QMI service.
> > > Client drivers need a way to discover that service, map DT thermal
> > > mitigation endpoints to cooling devices, and forward cooling state
> > > updates to the remote subsystem.
> > > 
> > > Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> > > Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> > 
> > Wrong SoB chain.
> 
> I think Gaurav wanted to reflect the changes did a back and forth between
> us, so I ended up in the delivery path somehow. I guess adding
> Co-developped-by should fix the SoB but won't reflect Gaurav and Casey did
> actually most of the work. So I'm fine if we remove my SoB to fix the chain

Anyway, Gaurav's SoB should be the last one (and it should be preceeded
by the CdB tag)

-- 
With best wishes
Dmitry
