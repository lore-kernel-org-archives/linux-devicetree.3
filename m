Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EB43C09E5
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 07:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892348; cv=none; b=EXcqMH3vJXqVoFda4PPIRDMhBTkn4rXQBBAtuo0EMVTbXmfLX+l22qjhS6j7s+domisoaC+/+vxy0oipcn/2QJvp0uH/NmAz0GHiYYcs5zRuRdk+eHO215eFQntpFtoAkTA20BfW4CehPlSRF0Cd5fcm5t0S5pflU0SI74Qc+OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892348; c=relaxed/simple;
	bh=XX9+R41IO2Waz3zGfCXQCa/MiWGzIhUUWvcGbPET3HE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F3QZOUJyWYZCKL1YZ/zTcAD3uxLyN7LbsYhWlotOFF8+tLKmje1eEhFI2xrLmCo7+doL8aJKSuLiq0BTJIviK9TBZ3e3JUWU4IZ+rx9v9xCOSUN1EL1FoRcEDOf5O6Kl0OooeuPBoUbfWIB2CoO4i2JM+lSBWdAU+nFDly1tcjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJyLHyJz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WpbuvNWA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJyLHyJz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WpbuvNWA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lYax137167
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 07:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPg2mmrIjGtehWgW9WQsfatVGe+8LkRJPKi00NnnNrY=; b=DJyLHyJzqpZeyj+t
	F3DOIOjQW8UYjMmnGpMkTdsRPKh6IikBpBePlLH1TxbNlxLWLBP1cAR8Cjusx965
	JTMRZW8t7Vdgl4MY8Bp432A/Ex++vazJszT5d3zobKpXUTgKsW5E2CANeiA3K4GC
	u2o6h4RUHFXoZbxZrkbJX/rArLdpODLhtvtEDp3NN0gmzoMrY3L2BbJfNTCWz+4I
	pIxHScDr7e+f963vYAENp07x9TRGb9jw99gwElOqlKWJdFbz6Lu0s/uI8nrXx3Wp
	r8Y+gv7rWa5JlU+MMdEvFbPC/+3yYJi/WH9QBAYhmw6hMvhXDqu7G3Pt1lhN3LlA
	u3jQQg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0auj5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:52:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e66f9e2baso35297785a.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 00:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782892344; x=1783497144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPg2mmrIjGtehWgW9WQsfatVGe+8LkRJPKi00NnnNrY=;
        b=WpbuvNWAE/Yz7ER4mFdmD6sKG+6h3BFWfFN+wkaITCCSnQl9SfHgiwWHcng2O4y/rq
         tFQzUWMUA5cY3J9I+/u2qFFJFWjdhWg7kREFI6etscZ1LqGtH4+Str/ujmSCfQm0bNd5
         iiH1YFm0g4qNOcGSHS/5PEk+YKGFHFhXGRjBqGg8jf0laqXk2sT6HAeeIkfQc1oEXoRK
         qNzqeyp+H5M0Hn/8dVIhdlvad8cig7riAvarOUNvq4Hn+vzZF/9LERdeRzk6AvhNH+DL
         EX/zVx57zq1EWbBJeJQnpWJWYI5zBFyKXwaDXhA8uRHA5Wb3Ge7RRM5UfHIw9To3bNIH
         Ey+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892344; x=1783497144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rPg2mmrIjGtehWgW9WQsfatVGe+8LkRJPKi00NnnNrY=;
        b=caHeN5fj2EEvHHCNApisQIdcYvctPKKs6DR5Bh5sv46vMwML+8JExY/uzjadSmoe78
         vtUaAZ3dF51rz2pHl04X8E/8VRTeGDaOtHjUhbDbEUVSzza2SCbCIRmy35hbKFuXu9Km
         kQe8sJXYHzw6JTGauCZsChAI63MTMcoK2vW3utnBOQ9nXyRDu+kSb2Goit80trCQDLPx
         eUffuWpH2SOzuJ1ZWVkzonY8qVD6pYf9zjMf6JjBRVXNO0KvhZBi38z21UO1b3y5MSLq
         z9VHoLQggrzmt+uBYyCWsquKBwXMYTpL0imR6AbN0iWsnkF3+E6pJZWc4+urqVIvsCZZ
         YQtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+X/p/NTUOg6hXLcu8lG01pc1ma4grEBdFJdsHf97BI/ARgcs/Qlj50M+L45mgsEYKb4kUxMvp82VLm@vger.kernel.org
X-Gm-Message-State: AOJu0YxC0EaGPpff7tgzCy2iLTzHz3TJdgjRvzuj7y+TaFfw0IcaOx9F
	ccoMhJBCOeJiTCHq1KCqwryW5mn4yQW71VLaOQIHDeeDcuu3FErFP1qSwO+d+j81ZwKA9/7fUHf
	BN5hCP28otOfM1VvemE+qKtwxHGJ19UkRnJYhKaP5n2gd3eJ55iBB+3KTwGbdsRF701tRx1l2gC
	U=
X-Gm-Gg: AfdE7cnc4KoofGIX4lgjc77ecEsyH/LSN8HylImfYZ8tFM9VMCGkUMhi6y9YlBzmNCB
	DupKo0lnbduJvgBPoJcX0HePyIGAm/LkliY9sf5cCQevonpB3X6amucoB04RPb/hg/YmFSoZ6s+
	WT+MJpJbM27S9ZcwL1GGTU+ob2VUMWHPDXZTWgu/WoVrXHlOmVf89VVPRbAF8nCzXkPYoWx/7Xl
	NeIu76bRITtgqEbgzxurdxCcDfC5ZaYcbyw3/UP+aEmXOAPH5JAo0V8frsc924w3iAxz6JDwELO
	EQY9lW1gjPANnPdBEtkTr0GqyQP47NHLXE6OwCwqc7nqw2DeHsRQFildHZv2GIPQ0JXdmeb2I3E
	Xq1xX4WE+vymXzvk8Q2BK9EY2dCC9mYmXQtGDNjk=
X-Received: by 2002:a05:620a:6497:b0:915:b852:4361 with SMTP id af79cd13be357-92e78227432mr76176385a.20.1782892343585;
        Wed, 01 Jul 2026 00:52:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6497:b0:915:b852:4361 with SMTP id af79cd13be357-92e78227432mr76172185a.20.1782892343039;
        Wed, 01 Jul 2026 00:52:23 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4718:fd49:e3d7:676a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be45f244sm64974065e9.0.2026.07.01.00.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:52:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming Maili SoC
Date: Wed,  1 Jul 2026 09:52:20 +0200
Message-ID: <178289233634.6073.9735895489826233582.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
References: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44c738 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A8WTr56GNT0h8z-4O7wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: u8DLGayjE9R4YDWJxcYxJLHdC2vGFI50
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX2mr8zKk8vi9Q
 wAdTgxSLeeokNskEq1a+SRuNKQO1qaAbHRz25+VK6nqcV+z0mjvHnMOuFHNMarEMgzj/nfo+Lib
 ZwDh07Z08rC7eEWVYu3sqVElVPEH4r4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfXz7ERDwD/asnx
 EtcJp03WMfQ/qEtJSSyYcdKZ1WL0Pfr/aXDQBKC1ML0eghnkno7S8UJ5BIMioj/Hq+UsXrA3kPi
 8fqxgJL8yZuAwC2y+GMiTmGMlKvRQvqqCfeocSFGTO4+Z3gNwbsCONxo5vVaIW7Ti3ah8MnWb5I
 iREyluFhR61iZ/m7YmYAzzqYeaGEaFHERXCfSCfoRWj8zgOPRZUlumoCZcWej/gXOoLHo0pY1A/
 ya73GOOiqbTD0kaGo+b8JvYtsCSkbcTM9XW8eLzjGI6COo0KnYJw+Liw34bhyYshOE5xw3NIqMd
 ru9kqd+ibhDeV/8Uq/hTb6ygS2TA+ZL9o3U4JisAYEU9ez7CPxaU/QJ8wL5tig2MIP0IxYAdan2
 kkx/GTXq40vvv5TadM+cxSDakK4umlLDUcLpHQfZyiXH5FFtK++iFJ47hykGatTaePWQDriuSrW
 hX5ILVEhjHwS/6m0HPw==
X-Proofpoint-GUID: u8DLGayjE9R4YDWJxcYxJLHdC2vGFI50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010077


On Mon, 22 Jun 2026 01:35:31 -0700, Jingyi Wang wrote:
> Introduce Top Level Mode Multiplexer dt-binding and driver for the
> upcoming Qualcomm Maili SoC. Maili is the new mobile SoC, and its DTS
> will be upstreamed later.
> 
> 

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom: Describe Maili TLMM block
      https://git.kernel.org/brgl/c/e95f2b212c4a8ec422b1627e36e951e778809965
[2/2] pinctrl: qcom: Add the tlmm driver for Maili platform
      https://git.kernel.org/brgl/c/251b53103a2e5770658ae106c490cdd2b7512c3a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
