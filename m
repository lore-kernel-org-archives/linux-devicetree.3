Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF173B95F6
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294004; cv=none; b=l/wwAX0WLSdMSnLGtVVrTsS1bj1ptxLU3WHTefwBva5gcX4AWQ74CeyUiiZ0DpGRIX7fFSv3KV9pClQgugiy1EB5ZlSQpUvL4FgMm/exv2VgfFYcIUqbO1l/2jEFbt9b0+EPuxZhJ5tAy4o6WyYp9EX9M0Z0eFlE6C8agnuNkng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294004; c=relaxed/simple;
	bh=us+Y4Cb7pFVSLnADy916NDIEoYZAuE4XXB6lyTKrzXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVsjVjsnLS2jxUZ8t9ROZVXe6qgONDOaXE3mRdPufyFLWhfaLoQ+ihFcs/NZSFcx0iyIu3M2BTjIAUOn7vC+WSqy7NrCgB9PkF3tl/PULK7+vvWuQCXxseSXZ/YpOB7vZn9Ve9vEFVBDjP0qGlhjWWbilC2Mh7ICANATxq4bjZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4onTU89; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWPD7G4j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4onTU89";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWPD7G4j"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RA3nlx3123502
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zpAVUiE0mWNRiDxsSieW36zbJskMY3EKSaK21P2YpUw=; b=d4onTU89SjGFIA92
	+Dw4xpZDQ6Tg8GvDUi2FEzcjwhlE8/TfgV/Xbt4kQIXZuyGCzxwEcwKjw20gItR1
	sh/trF/BOGYFIzf4SgDVFnMxdyPlKitrZGfdYGFB8bYucbK+TlTKOzHN+pzMCfHE
	OLvldclOEfDS2Ynh4Uu1SD6I3JvGYsPE3P3rEpT3D2/NhM9kOYqgr/5qoxZtXrsL
	mBK90fmUBxyOKJKv2W7CNl2IB3YzexdKgMxIQfT668CoZM+dSVmH+4+VHg+i407k
	j7h6Dg8ne/Uwj9h0hBUJu/3yJfC+Q+Wct+UwS2g1iCJbecYyY7/OoZzVtF2txBK9
	e18EFQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgghqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb007bc36so176573961cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294001; x=1777898801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpAVUiE0mWNRiDxsSieW36zbJskMY3EKSaK21P2YpUw=;
        b=JWPD7G4jZwwfw5gCpH7kwworxGE4Wg8pOPtCfc4pQ1av8UpwNVAGtMaN4ch+xOBY15
         Vpo4mXqDWBe754KGWZ06IgAfOdXw9121TAxlH1R7WB+MEccgFNQSy2fJJ+t8suS1qhlb
         WVFLqCpRpSp4N40YQrjLjhd1J7p795XebIz8QuahxqX5gCZ8s/C+nATV+aSIUjDHWaJE
         UbQMpQcObnpf1KaS48ijKpLpkRXfawdVB46gXBiHT9qaN4gbzWSAdZ3/n8/qzCpEMyMC
         C3CgoQ9ZC37FB1LHoTJu+4nqn6arEIfkxIZZhFLG6E99DCgWKkeQM0mCVVNpvW4jrWHi
         4gIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294001; x=1777898801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zpAVUiE0mWNRiDxsSieW36zbJskMY3EKSaK21P2YpUw=;
        b=dHeaom127OWfHoVdwnvPwHQVZqG/6iAvXdk2Q/2hK178N3ve4zYYYXPAPKuXOBPKI3
         IbNxU/6Mp+B0RzafX4vsZnu0+xc6bVs/OmTOofx8VSYe1WBgj8KAaIOl+WVd9d8MKbFB
         nRczKQ8oaRUJouQ17fqh02wFNv4SWey9MezCtCR85RPycLKHcnFjGAVCfWtjunaJIP4O
         GtW95Aluj3WXrwGHn+CdZAQNex2skZ2p0aSSovGEUitUClXVSSJDMaxCW1nD4z9bp6M1
         h/sewNBuwLCRRrP6k0IKQIfkxDyYXGy9CTlhpM8vEbkO9rl+uwkxzLbCo04GRMjaBuBM
         8Hpw==
X-Forwarded-Encrypted: i=1; AFNElJ+aL71IUhJPrKgudmeaYPyeVxEHC5RSfJN5OPQ+xQcIJPQvZaxdXs1Hd9ncdFc9ZnVfmkG+nNRZxzvr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9TCyHvV8K+w8zi+Qn6yZT+xKHNTpZA7DSQ9nyJqNtwIdXz1vC
	a2T9weFBjYZSGM1gJXmjRh4a7z/cFC1FWFdLJlcfwBPK842wOY7OcU0Np3iw6AUFSEQyLrVAHTQ
	CtPeKDnv4RpcSc3eIGpBcXh4JZJznSuvwyJKVUDOxobuVgjrEItV8QQ0+RIoqkgQM
X-Gm-Gg: AeBDievImNXwxPNYej+xw0Ho/9r3z9Ohy2fNaUP0Unzo+8F01TF5Bvc+QcOLj1L5jng
	jLl7IQEiKN+0E5oEMjtQCvk9cF+YHBug5Tf95GwNA+akxdXPqc/nxb+QmJJhyt2SQrO1jffWaUt
	7lM+MXNN5WSJ2wKTqgpWBTVUev9kEkQWk6WWEhBNNK2APacZL6fDR0kXC7iOwjK3/5fi1d4dKUM
	8RNqsbQnC2aqLzKuA6J87Tr37Ze0OkJOfbFr8qsctnsW5Y4wVsoLXReBgGoEkYWrPC54sBoNTcQ
	bRLBlcpI2/KiriUosDoJoq0bivBbpxMwRjhIrhwqRotKNScN9WLnZNK8RuHwfBPpiyC8EwOxA1U
	tou11NK9x4gKU3i6k5VR1RCZ+NvaXikbfnxeza+XNjQqxNYDFiQ7IcKACxrFMMm8Quumg+bkJMm
	lcPs+N2b//b12icU8JmhVcWvjXniI=
X-Received: by 2002:a05:622a:2449:b0:50e:6399:eed4 with SMTP id d75a77b69052e-50e6399f879mr479265491cf.27.1777294000914;
        Mon, 27 Apr 2026 05:46:40 -0700 (PDT)
X-Received: by 2002:a05:622a:2449:b0:50e:6399:eed4 with SMTP id d75a77b69052e-50e6399f879mr479264881cf.27.1777294000497;
        Mon, 27 Apr 2026 05:46:40 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:30 +0200
Subject: [PATCH v2 03/14] media: qcom: camss: Add PM clock definitions for
 QCM2290
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-3-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX/fvcZiWsoso7
 b/LYNyvFbrp6Re3LTu1NqWIxKvy3CfowVvOFzgiDeMb8vWHYCbinghibTuCDBm7T/s6ni/OWbWl
 kKXP0HOaInEaQUmb1uoOJYBH4KJHutyPJU2Ve8hi33X8bXYyShqOi9CjoDe8Bczy4jYWd5ht+Kd
 ww021XQSReO+IyrlK7YX1DJ9/lezJW+pi3urkFVaQVuMNAMTVdklcxR+zxbGs534BlxzHJn7DuL
 PtTqKDCMPtDisGYs4cx0ae8K1CLHH3Zx20IG21hFoOckjwyxIhlDTao0rGsRu4Dto0WnEmU0BLH
 mo/Md8AXbJa59JLMNMlsNWKVnEBotgPj5MyG4Q2XZtS8PlOzrZPERsh9P6L9RdeWonH3QFDlXHw
 RY3QFATEmD59doDCcF2qXxnOj0smhe9u+TvzRMVa6uTj4fMCbiRGEg+3aeUJ+4RFpNXnDETD91m
 Qw14QsdIyUlVgCAL29A==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef5ab1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6k50daf3fveMbYCwvhsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ii_GTJ4KwR9U_VnUhAiXOtoihEr-NNk0
X-Proofpoint-ORIG-GUID: ii_GTJ4KwR9U_VnUhAiXOtoihEr-NNk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270135

Provide the required CAMSS PM clock descriptors for the QCM2290
platform. Register the top_ahb and axi clocks with their appropriate
nominal rates so they can be managed automatically through the PM
clock framework (both are part of the camss-top group).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ca68ad7fc9ff30eae23d3baf34cf1ca642acf9d7..b2b0afc3fb5f597622f9b4ebfee2ec6703bf0890 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4846,6 +4846,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.pm_clks = { { "top_ahb", 80000000 }, { "axi", 300000000 } },
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,

-- 
2.34.1

