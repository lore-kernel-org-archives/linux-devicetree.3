Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6865A3E556B
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133681; cv=none; b=GCOyldn5XKnC/tK3oCV6NEYwsvkK3FEgDlK6PtnlAbpvti0yEXSIA0ZnwAsXSp9d7mr9w5FcoJGBbP1fIje1C2BIPoK7TXHnIPR2cg5scIuqUgjeOIQm/hyEeyxYp+tagDIkVaenKBwqBcOaCwiuR1OzaCyS1v27bZUsnEEZP+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133681; c=relaxed/simple;
	bh=CQQOsVNYXPWgs9fvED/8XjGSPi4MvN1+4E4vHhPw2T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SELCyJf2GEmMnQaTo0T+wN36LFM4iTMGdDhEpOD2SxmiRiENMJKeRiYoDtW8nyCWR2cAes65UZQoG4ao/WZoIov6JOJhmBLF9El8yyEZ5wMlLpFDmEXfcM3rvLC+7u6oMBDgncj35NH3vbci+VOQZmbdk6ntP3a0Sg1apTlH3Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXFLrFwc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3N40qMm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXFLrFwc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3N40qMm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCim39328256
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nK0vFGtg5QgNaoNnYyvBeTW3
	5yhfDRtCR7670jeoDy4=; b=UXFLrFwcDScuAvtfIug1g3gLhqLuH9gKDVVCAgkG
	9evBkgMeujpIS2NBQrZFsA8cCSv38gZBIBUzIeqTiynFMzM1rNbFmaICqcL/PR9U
	fAp0julQB02eim+cEKXrKGOXnz6LyFHWer3VLxOVkEwXuY/a47P90gQX9FeDH6kS
	+sCDA2tdKYlkqv91fB8ytpFoce+UGQbKpKPqb6ETLr+yZ4Nif4jJnCugOyvKCQf+
	XSFVg7tQ+X2bU72ur7kTt6EqB3qybb6hr28hG4EWGLruCFQ/Hi2EDP9rXb33HuhK
	vdMdowrXxCxnfcl5TjDZcU73eNo7KBH3VsdzcvJMwfGoZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q435ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:34:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93918756165so165050985a.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789133672; x=1789738472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nK0vFGtg5QgNaoNnYyvBeTW35yhfDRtCR7670jeoDy4=;
        b=B3N40qMmht6ElT7v8DGl8wuKXTqWA5Wa9DR8eqjjVLGe0mTW8lwwZr2uaAr0TVqk1X
         btzIyX5KGQxP2+Hapn/eSy0rWq2kvykLq6ii3dZTwVu5neL5+xYQVJvxSLut1RePeWvc
         Bet2Np7LAGrGsoAqP+8PDwoGzG+floNfx3EibiTTqY60zBcLLQUFiPpeUgY8T4qJ5Hbc
         Wt1Z10N+wm+HWu5RCzS1XJ0EIRwq8qw4dxbRzcTXgEO4FkGiNLkul09r2vhHl05EAfbZ
         Q7aLvw+NmXYaZHyL9Ysakgpxa3s4smMRTz/d6pCYeJ1dDLS0xVfpajjUOCS4VKUbOzI/
         E0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133672; x=1789738472;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nK0vFGtg5QgNaoNnYyvBeTW35yhfDRtCR7670jeoDy4=;
        b=gdXsutumopgDFxcXvP3gfAAB4W7Qujqye7ScnbmmfLP1cKgTllisF4lxFkCeQwHugf
         f7WBtXXApBveBceeWHWqfVDXAqm95v1D9g67hkDm3+LQOXvHkA40AHUA+wa1f56hrWPG
         TSN+d7RKGA3mAO8qPm2avYl93KXz+1An3KHG30tiyzom3wvT9UMrPSPWOrqJB82qnW/3
         gOh/Jjf/7y2j3zzGlRW5/zcgP1w+MaH9OTIdgZo7vWhZV1joiogiXNUzNPMCht7CZZQI
         NGIaEpDF2E25jwEfs/vCFPyCs7uVXrEl0djgRMf58EAKYhiJEWgs2geLNoMkEollfm0l
         wt5g==
X-Forwarded-Encrypted: i=1; AKwUvBxLmfuyYu88LD5hwFUkA7XVBbyraodGPXBrez8ExdVZt0wXZTSYI2HmikTklq7ejD3m7bPCskBRGtSH@vger.kernel.org
X-Gm-Message-State: AFuF++lAo0paPlERzvDq9gGvBQQGdNGKPFgqoivkBoM2ehO3bemw7dhT
	8EDeCj8iiTQLljs3CyUPUH6EBF3A4BfHprcpADJ7fyL4wTv8dHk+eplZh1Z3qBmTAdxdFD6WxWt
	5RAwBUcpJ0NXWplZdKM/gfTFmcmQiXtMNP83Hy4BVMEYj5jx0ZXdhjs8ZUnpZ8WtA
X-Gm-Gg: AYBFou12J8Qki9T8qk5WmeCDd+H46RBTfnAYD6w+ftLtnDwhil/MYaoIUgikbUvaOL6
	R5oywYu12T6XYEQAopDKSodZBWvC8slOp8Rk2uSAMrOQNnYIwVAIaQT+J5SpUixzEUJvU88lBWj
	5ZBZUTKn0ADCe+KaHv/BfZYnZRtaDfe5rTiXRiUC8IkrOf1+LJpD/4L9t32GjLiSUaeR6e8AnkN
	xVFdLXYhKqUuqFhGX61ND85GNenLFAti8nwlbx1AA8xjbNEctSPR+8Yd0USGy/PqHns7ysSQ0VF
	oIBoNdhtDQNrz3MEZGSVXIppglosq1nNbMvRBFpvJHDOi8AaKbFiNaR93y+t7DBVw5VGCRoxJJv
	9TxHUOUnteR5tFf0=
X-Received: by 2002:a05:620a:6506:b0:936:ef9d:2c74 with SMTP id af79cd13be357-939ea212a7emr626819085a.30.1789133671708;
        Fri, 11 Sep 2026 06:34:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:ef9d:2c74 with SMTP id af79cd13be357-939ea212a7emr626809285a.30.1789133671102;
        Fri, 11 Sep 2026 06:34:31 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm5358056f8f.35.2026.09.11.06.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:34:30 -0700 (PDT)
Date: Fri, 11 Sep 2026 16:34:27 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: shikra: Add support for AudioCoreCC
 and AudioCoreCSR nodes
Message-ID: <oa6xnrgves3llyn5ojc2urmv2yrkrcetwui6utx225r3hiqzjr@rlqlp63xqji7>
References: <20260911-shikra-audiocorecc-v5-1-b0fc3a2251ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-shikra-audiocorecc-v5-1-b0fc3a2251ca@oss.qualcomm.com>
X-Proofpoint-GUID: teSPHGdkSoSj0fL6jC6KVrbVhn9XapOy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfX1otiIL3WrXGD
 DmCkbXGNvOQtq0qEABx9nCn2dd0hrixI29ulAfLbrMe/LD/qXpfaOE/nWaS6nFCyJXI2Mxxp5ef
 2+A5xCEd3to9qn/UGMSGYeQmpmUxjjg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfX5wtK9AFJZOF8
 gWBWz9DxQHw4anIHr5uripMxcxgo20+McQWr2r44sEJ5Yeya8AuDLj6NoEXtM4n4CMMseCHhqot
 b0dDBLa0LtBHbU/DkroK0f2eEPhYr/NsyvPuqxSC5cnPrHjBnZy8OrlSb5tQIsKvs2Gbx1t8DKc
 9LJHZPaNkXGPvTwhGWc7FbVq5rLTeSSWQmFyfjwNMYjJPBJK/vYqLxLaQZsoKVpU45GrPEG30Ri
 Lq2fUF9ndEm2pVdWcruhSFHB80qXGgJFlBCDEyMERwxIQ61b83ivHsB9gwAIWK/+Zm3ryqF55Ac
 xZyfDUeCGhbMX11bW2lQdyT7u4/uQw0KwqZux/Y080aw7JisOF4U95m+v6QD6+ewtATuHF5U5q+
 OUG9tUZ0Vn38wqLVC5N4I79bbsXXtEZnRxmmISkE2LwFPOKEdu/trkG36ZNbbsI4RP6I/Na4e7B
 JF7g3mUBopHFMapkHzQ==
X-Proofpoint-ORIG-GUID: teSPHGdkSoSj0fL6jC6KVrbVhn9XapOy
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa4036e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tlOuMNSg9W14aln77gIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110189

On 26-09-11 18:06:04, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> differs across Shikra variants based on Audio subsystem enablement as
> follows:
> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> are required to be supported on HLOS.
> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> handled on Modem, so from HLOS only resets are needed.
> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
