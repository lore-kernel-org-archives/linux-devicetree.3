Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182401;
	b=xIvV2ZUUw+/ahkthoqkbTSVipYk0fQPV5NSk4CmbOGW036dCq5LKu+Qsu9VxFnZxEtZk
	 5PJLBcBJJPtPxz4ya376iCwbiWrzgjJu0jS/HdvzHR4ntXiNGOA43Eb5T23uRlDjMkaZb
	 ksYVJ6HlRy8MDBgf+bYz+tYByNDpwaShsGiKXTsxvE39KPGh6ElbebfM6on11euJIvm/x
	 z0GzEtJ70Ahcc8r5iauPJBv/PaAAhmxyRYZ5CvArJX+H8hs04jIrhiNXSu1kgOdB2EErB
	 MBa1ZPy4XMvxWD1G4PKTDG/r46+76Lov1+dfgIRmS1EbBnBSeB0HADeqEmSpxakswJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182401;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4GoiSSZTBci+FWZ8jvsDrk8LVCpVLRNNBYJskL/l8Fo=;
	b=IqX4SHtyUEIx+krVRdpPiBbN2Ldy/gLdwwZ8LA9l6bATSxaPPx4fi5Vwe8BoiY2EzTyM
	 YAmaw2XU0IESwo+DQbfB+Q3mj/xCvSkfQ7KYs/Nr7bDr9g3AecwJJW2ezw0nvHkmM3HAd
	 xjTFtps3/wBivhyvtqYXhAV9b5omcNG9cuuEEmRZJ+ywkmoUb2kmKg/9gXZNiPjB6bSUN
	 xJ8vmIRzWaxlgmJTsLZDO4yG3MbOhY8eMxOFU8uBMVbiCpvRzlwF9ADTxGT+4F7LGyONj
	 8z+mOzlQhJgLmxry9kDHnZzsankP+Y15k4fsTC70fvii+H9zYGbd6z1jTr412d+LTew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cVeYb1Zh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kaw8xQpg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9468606A323
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9468606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cVeYb1Zh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kaw8xQpg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KmVM1101702
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4GoiSSZTBci+FWZ8jvsDrk8L
	VCpVLRNNBYJskL/l8Fo=; b=cVeYb1Zho5kN54poLg09hAt9NXAremIF2oEjcxfJ
	xZPGraeREvqLKSwr9ROKamr9he1IEQ53PM2Y9WV47dzINOuUekdT6PIawSIu6KJi
	OvmrfBET1dUzDId/nPkaf8f6h33UTMnt2F/ZI+CDYURZBcn0onwu9v04UqxCrKP2
	9ku9DMxl/S7c1s+/JfFI8LHhDb6m3qoQUBa5UqGYJrzWeM+5EJEKiuuWcNmHs/iv
	+xOfPL1GFqAeZdqo4RC3PnIFwMK1N8FkB3ORG0PlQA2opBcWhztNjZvWKMyd0yB8
	ZFy82CMvyPKQDx9RJ51+NRHuquLBOq2pjSPdaY2VYQpUqA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rdcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:13:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so1742787eec.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 03:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793182399; x=1793787199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4GoiSSZTBci+FWZ8jvsDrk8LVCpVLRNNBYJskL/l8Fo=;
        b=Kaw8xQpgNq198dq7TyahsEbocmVT6cuKa5aYvzNLerZGLlPa+BXk1u6jhr/hi3qe95
         /TnygKQEHLHjFYwDV4NpZegNGb2SQXuBwcONsWZYdD5zPTRg+BFr+cagND8ilrmywn1O
         mHAEHuNtyS2q3EKnFYRfaEwKeRnNY3VxOa9ftwgcOlFZwprJRrpkzF8FWjLYrjt2+qMz
         edCelqIOirriRp7TeR6KjnCeL/ecTKnoNmLQiwLSIedIl4RaTua4gKAesR9hv3s7PNOC
         2VP19vMtaxjDEg36GbbUylPqgwWYkCdT2wzVe28eZXqiJaN+nSmnyyb/rUsH9ZlkSLCP
         hWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182399; x=1793787199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GoiSSZTBci+FWZ8jvsDrk8LVCpVLRNNBYJskL/l8Fo=;
        b=2g3EXvYsXmIhLsF8ng3BfOGV5EANDE4+K30x8BBTaxdbsr9lSK9gvvZz6nNWSAsXD/
         hv+wojizos288LGQALf1EoY6Ae7eILdO+4Jepp6xogeqnnlGfBzv+ruSWOuyZtO/jilQ
         j+oo8eT2i9V9Iz72qjJKl01yQxaJdBQMbl26QKmWB6vnamZn6MT6bkEdi7Bman9Rqtd3
         NH4qHBQwF1KTov2cA+oSqBv3K0IoO+mwjIkLFSr7gPIiXV0ZNl19YNpOnnibi/yyr6wl
         OpETchU2lVOCRIaEiY9AnsL1FF+R+vvkFbo9Oz+SROFz1CNfptfKJ+JdYJt5Xg1s+yyO
         Hc0g==
X-Forwarded-Encrypted: i=1; AKwUvByOugi0gP6NTXblo+gkAHKZu4fkmDxMw+rePlu383I7VBjqsd/p4DHPNlqPIiidIO++6l6YX0cencCu@vger.kernel.org
X-Gm-Message-State: AFq9FYLswVmswycM/H6MR+EDrz2nxS8iZF+7aC7fhJgKrx/3Xe/jI3to
	XeIMj4mF3JKywQpJA7tpf6UflZ3JIWdtZCPvnZLLprFHy4Qdo2FXGgQkwEdPa5MswwWefvh/AIA
	h5OmQ0bgF1hSJrmik0ZJrm2JmgP8EHDNklhvn3akvicSIYn9eXiW2ca6PTWzzRxjF
X-Gm-Gg: AYBFou0MbUIJwuhfjBaBpevBH4cGk5KMof30EEwaWrPzlDz5a96+8376t09rn2RdGro
	/HFHYNKpvrYhMyyzLGZTBqZOcKQ67HejarZNSAYRtGZvYNDBQwrbOPvpy6jet/lketUARX+DQLc
	qGEPNV5cqlhJBJ2ii4IACnkr09YPiXXyuDA7KHhQ4FaaUmDbggPHjke3CXknZbEyWg3OGMyGWMg
	U20EgDIfpqggvOqoftvXGN8dMU+gRJXqRDaAjd/h6J+vfvC54Mzu1+EL2taMZleTlk82ZksonTD
	uqxOe3DX/sT34VzIKJZVvYvhq1+RBxKPaSEt9piNCr9SPB6qivPdWOboSIyCwfBs22C9juhPOvK
	WF3nUL2LHvIW/cCxakccYEJmxCn4+rpY1eTL7/jVY6XkHMw7zNSXWQq7LlywNdF+njQDlpQsY1o
	DsLPVEaEllMVSje7Y=
X-Received: by 2002:a05:693c:240e:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-36a204049b5mr2973414eec.40.1793182398560;
        Wed, 28 Oct 2026 03:13:18 -0700 (PDT)
X-Received: by 2002:a05:693c:240e:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-36a204049b5mr2973376eec.40.1793182397948;
        Wed, 28 Oct 2026 03:13:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237bc445sm4865357eec.1.2026.10.28.03.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:13:17 -0700 (PDT)
Date: Wed, 28 Oct 2026 18:13:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans: make the emac compatible
 specific to the embedded variant
Message-ID: <auHKt_hdMPaolIR8@QCOM-aGQu4IUr3Y>
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
 <at8Q9umfE2AP24lI@QCOM-aGQu4IUr3Y>
 <CAMRc=McYTWmV6iAbm97C-xs1vh9Atvy-LivQBW10iHQh5+rPzQ@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McYTWmV6iAbm97C-xs1vh9Atvy-LivQBW10iHQh5+rPzQ@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1cabf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=d-OPr4wEzgqMDXe8fBoA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: RKUD1rJ0wHg1Y2X1mDYJ8Y2sITrL8ZpE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MCBTYWx0ZWRfX+kvepTm7qwFk
 j/ce43NER1Ud0E4zByGAiO9wlzzSKC7r9hKWPHetd+THEanwCTQFA26TLx9Jkxyt13UbUBohDk4
 HX2ecpC4iM4MeEQfoQtXH9guRH7/tqc=
X-Proofpoint-ORIG-GUID: RKUD1rJ0wHg1Y2X1mDYJ8Y2sITrL8ZpE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MCBTYWx0ZWRfX1jHJ8zA7UDoh
 2L9KvC77XGZmc3+zcTX+6nFgcCo7ecZZ9lD0AWbRtwbiGOSfZnZFw/J1Za6xsIULe0LJBHqM71G
 VsUwqefq34e7yWXPedqNKd5dmRRySly/hFPTtWHo4sNmp4QiQcpUHgQUswGrNuonq2w9wx9zwPT
 jx+ExQaZwv7yYlMm8odJZR0CjMr7pj5KVviHyrvrIFy4w9ZNnDO9ZszFqZtHrcNcAq4DQqVdtPV
 VFs0NOplpkym2J9wpx3CQqFMJ36bR2/gOgWmEsK3UlOHYFHtEsXJGA6p+nYAyMJTO/J6s0fiHSk
 Y3xAlHd279/bYjq1aI6Rp+dF9TZNyB6tTXFx3DP5fUV1sHhmzHbC9CBZTCIi0Xij61ZonTMu+od
 upRgIJ3AziDG9arzg+jqVT1MvwJ+5b4iGgeBCD4WLVc5leNg/gofKJYtzFEQVYKsG30IoENYp3a
 4niF1IRlXEWwRWMusdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280040

On Wed, Oct 28, 2026 at 01:25:34AM -0700, Bartosz Golaszewski wrote:
> On Mon, 26 Oct 2026 09:36:06 +0100, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> > On Fri, Oct 23, 2026 at 11:02:23AM +0200, Bartosz Golaszewski wrote:
> >> The embedded and gearvm variants of the ethernet MAC use different
> >> compatibles so move the one for sa8775p into lemans-embedded.dtsi and
> >> make place for the gearvm variant to be placed in lemans-gearvm.dtsi.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >
> > Do we run into any problem if lemans-gearvm.dtsi simply overwrites
> > the compatible without this patch?
> >
> 
> Technically no, but then lemans.dtsi is incorrect as the MAC compatible depends
> on the firmware variant. I'd move it if you're already touching the files
> anyway.

This will be inconsistent to what we generally do today for both
Lemans and Nord, i.e. we are defaulting compatible to Embedded variant
in <soc>.dtsi and overwriting it as needed in <soc>-gearvm.dtsi.

Shawn
