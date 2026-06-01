Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DFB21C9EA
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 08:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303281; cv=none; b=FFH9dQr5HGLBFJ9Bt2w5waT8SXZ0XV6wjXRh7MfXWMfKrI4/S03YCpPa7zGwnzxG+NSx53wg/qGM4nShCqzAkwRabz2T5E/peDDGlbtnwiDkKftLq91bB9iobfawIgQkqA57K72lBgBtJaIXVKnQjdHwL/a/YKo8ppWCdod9dJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303281; c=relaxed/simple;
	bh=S/hLZ1FOgth+2vljeM9PnlmEtnZOHtgGGQQ9sMQ9iBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9gBrWF72r2eqxVzseM/f2MTCWM/wFe3vsW6+QIBBp6co6mSfg/pZgLuRJg789Kf4zqOWfOmRu6Zn3Wv1oRZRlJu+ymIFYjhSSy0ichaRBsv+ZqLYvX1icYUJTRMRxMqGe0uwu/D3tiYBkTR9rTmnzsbS9/UfqqqydyjaUkZCps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bj4DKF8n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+2ssdFW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bj4DKF8n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+2ssdFW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518dQMD3563551
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 08:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rK7ulaq5hmgd4bp9elL0rBcp
	iMNXXRsQzs56XiD2wNo=; b=bj4DKF8nm35xqZMtM69SENSPEA4hd/YQ5aODHGr2
	2dV2QoMoJMxme9Fxu/uHOqvvRf8zYT9uHajUYoaUyRqcevt0JLgg+MRO4cz1z7xI
	mytnQ4bwkVJJ9drWi37wnoRwBa9Lq1WwLFe6kjFIplLg9hXsButgfEIrb/ozWRnl
	WUig00T7TqE1wXWnJAhS8L/mKiDjIcjPUd17CJlpKK184R6FcyTHe45KYEHr1Tpb
	kymSdY22yJJffZvZORZXjKuPxeN3qVbXEaLABLcx70ujSQ0FhzWkvmpf7OirzISA
	wPquvmOAcjrAsJyj6SbQM0fBjt1rUwE8YQm1rwe73L05XQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxr0ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:41:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf2bc4371bso17773685ad.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780303278; x=1780908078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rK7ulaq5hmgd4bp9elL0rBcpiMNXXRsQzs56XiD2wNo=;
        b=a+2ssdFWxu5azHxzCjonurwyNEN2TpmWQShdBSfdKCwh43KZLodCmjIi8NMNrTH6Cv
         nIrPwouW7EU7NBQ/wZOtWoW3qq4rTaxZ3jVInUE373zyDyA9DiQVERHkxRsDZ2k3vxXl
         G2yN8vVeRCbg5fXOUdRqpqsxHrFLlKIOI9GfsKxqVz4W6TA+jAlQOxkYdPPCeuPsZvJC
         yYkaK6tqVuhUfeitmZCIAtx4xqWpGMmKaPTSJu996NWtLdKmqzIEVdK83aTo0vhEuiOa
         s0wQzNdYy/bjuWBC2/9ZLGRvd8014Q58Eat1oYYfoUSDhg0ZJWwFjqHh/Hd8xIAvGsWU
         Y88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303278; x=1780908078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rK7ulaq5hmgd4bp9elL0rBcpiMNXXRsQzs56XiD2wNo=;
        b=iwcExLodzM4Ns2UAUbSfIJWzeiQqLr4eo/K3/zQQIhVqtEat4NDsapFpn/yThdzncv
         KkUjMinmF6JP77Pl0tEB4xFkzZDWUOVJ5uSxCVW+ZT5Qm2pJZvLe6ndthSSMSO+fL1ym
         EmKI81ioogHOxNKpavX/DJUyONqdn9s+ISrwTpHeAgLIf9RsxCAy5cfurAuQEpJlszPg
         KHIJ+50ncLi2+pPYzfMWqU5i/6RL+UbggeUn/RndpJ03mAL8vVlkM/KhIoxZgUM3pdu9
         oTpIgJdhgZxnJqAKrZA4z81AL3/OTekBw7B3yWpZ+tTFMw1SGJCf5w+IPLuTGAifvXEr
         cv5g==
X-Forwarded-Encrypted: i=1; AFNElJ9pXpqRo7PpJD0uO+n+Uyl0XKDmTsTgyg46Zw25bMHt420d5e2CgoNEf0PpGiqGnmshUb8lvDy/9lqJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3HrKftHuU3Wiy7QRgrWEMifcS5heRz/6i27ZCzpJzAoYJFpNx
	rAS6rw0P6vR1TkfZ3E9PPxioFXVQO+lbOHElXDZPe4WmUA9+xhy5s/N0Ifaqez/D/BLX0VcMuPx
	u55ZbISJF0oswAlVGjr9iyQ9WyrQggeSVaae0N8UlDyFMaVW8/XTugkgv3OKd8D7A
X-Gm-Gg: Acq92OEZ0rbeI2Nedh/v3Fqx0k4U9U+R4hVMYgmpgTrfsy5gBpk3Gds0JaW0fmCfHO0
	NyI4F/jRl4mE9BqGi/pP1Gqrusmon8bCEgg6ZdwS1jDHB+tEEMuVe9c2kXU+61BMa4YmsSgYBac
	aPl/cK7VF5+7uoyo3rRyIKdzC3Hq+suK2ICZVT8sQiu5gtRnV3K+rCI1xp+ByU+jVN7KjrgNsxo
	BRxknXhCPCPurnTTWKbPTDpRDCvSw5blglHZSkJbzM+EOlirNptRB0yKQIRUxHYu53gPheF9bry
	650kVuVMXFEP3E9ks6M0OjgnPixb3D97MlcP6s3AMLIoQDybhM6AgaC4i6FlNA3DzVClUUvLpAB
	6T/QT3ce5zLmGEy5We55Q634MWW2jNecH2NGmZwfJCRvknR0XJO8/f9ZHvrM=
X-Received: by 2002:a17:903:285:b0:2c0:a858:8128 with SMTP id d9443c01a7336-2c0a858836emr75197205ad.1.1780303277507;
        Mon, 01 Jun 2026 01:41:17 -0700 (PDT)
X-Received: by 2002:a17:903:285:b0:2c0:a858:8128 with SMTP id d9443c01a7336-2c0a858836emr75196775ad.1.1780303276930;
        Mon, 01 Jun 2026 01:41:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd7bfsm95714035ad.19.2026.06.01.01.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:41:16 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:11:09 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/18] dt-bindings: firmware: qcom,scm: Add minidump
 SRAM property
Message-ID: <20260601084109.nedh4dcqyuwo42lz@hu-mojha-hyd.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-2-mukesh.ojha@oss.qualcomm.com>
 <20260530-lumpy-zircon-gibbon-dc83bc@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530-lumpy-zircon-gibbon-dc83bc@quoll>
X-Proofpoint-GUID: 5bbImLTeu9_ZXn19u8kdOme0-NNKZ8bk
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1d45ae cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=6CMS-Vp_-x9uo6Giwa4A:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA4NiBTYWx0ZWRfX6V7Of4Vx3ckD
 snQ1hqw11S316axD680F1fWik11lYwMn0R0FnLFZX8WmaKc61b9bhIbDj7NB3tDVRmnddzlr+td
 ey8z8Y1aad1eaJ5LY4ZAp2ql1BHGOJdguomQzAu8pzKFvAVAH2mDPx3v2fhHUHYLrSNjaSBHS1D
 FQ8rZ/2GeT6ns/oBxw9IcqAMDsUZWSnK7qhp5/9WO2NKyNzufT2JeQYCV9mE0AidF1KOswurao6
 Cuvw5vBFoaSHCBznIp05ithhmDboCEqs31zESQe8qFpXyhlMQlMTR+y6KBykLmWCOxb/WiXKXXe
 hAwYT44ait5NYnC/eHsEyiiFbRcWMUFR8WnhFF4rzQsfL/mvg4JZSBCnNrVRzXSRMkXcalc/yKD
 kBF565TumZYpDRgibZy+On/dShWPYgOgBz6lPK9vq6ZGu9ZEQUntMBbie8EOMRpsanQlPhYVRss
 BNHNCNNGmczWTz+8Ufg==
X-Proofpoint-ORIG-GUID: 5bbImLTeu9_ZXn19u8kdOme0-NNKZ8bk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010086

On Sat, May 30, 2026 at 10:24:08AM +0200, Krzysztof Kozlowski wrote:
> On Sat, May 23, 2026 at 01:19:52AM +0530, Mukesh Ojha wrote:
> > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > SRAM is shared between the kernel and boot firmware. Before DDR is
> > initialised on the warm reset following a crash, firmware reads this
> > word to decide if minidump is enabled and collect a minidump and where
> >  to deliver it (USB upload to a host, or save to local storage).
> > 
> > Add a 'sram' property to the SCM binding to describe a region in
> > always-on SRAM where the minidump download destination value could be
> > written. Boot firmware reads it before DDR is initialised on a warm
> > reset to decide where to store the minidump either to host PC or to
> > on device storage.
> 
> You described how firmware is using it, but we do not run the firmware
> here. From this entire description we don't need it in DTS, because this
> is not a DTS for firmware.

Ah ! I missed to add that this region could be changed by the OS and
firmware could take different route based on it.

> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha
