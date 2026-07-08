Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5314540929A
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525781; cv=none; b=f1ZOwgJQMQXsOqLCTBTDp9Qwi5pVCymc0VzvGqYDwROGQ9m+1SqBmNFOFWLrqmNkCboxLdPF2bNSMZ1RP/sY20FLSSI3uPoDL7PgrKqKmBwnIpE+FefNx58ioDld56imDSDkzx8IVECrJZ/+3YpXO7F0k7lWGNrppgbGUA17cVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525781; c=relaxed/simple;
	bh=jcihse7XknEeHdBahZIOmT1iE81AjYNGrMrlfd6oH1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/QiCJX71dfMvvvvHs8sDLUi+cf8A8QadV7Q+Mf7vpUf6vw+XLU43zRE1qOnkvAqu61vGzsRy39rLr3Wx+X4Rne/uD4UBd98SxZzwKGRPQiBX7MF01CHBxG8GshITFHvwdMNH0KwbS6xjUCm6zyCo+LhY3Xo44jS/Ra4+p6WC38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LI7jphge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UP7bCnWa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LI7jphge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UP7bCnWa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3i1q2759133
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3E9wnYtQkQUVdlCALiZYvZk0M2bJge/N2ttVKzg1N0s=; b=LI7jphgeQRVzq2gI
	LaRfuoXgCoyv+GLDfKFNuvTG4IKXZQPmII4lXxdlYBt6Sp1hUK9m3zCFGWutgkb1
	16Kji+880UZ0wMK98Ogzy8SWebl8XhSdHQom/xFwgRVQBzZl8L7xyvjfeeewNwTX
	ZYkN1PO2eHAeFiwRH4O89zDXqUw0Q/wBfq51TWERqKdHZ8ECTODdlz5GRB1d+4GJ
	1xGnZtkdJnnwiuObYtPMcvwqdffmTW0p1oMZXjvykQnJ3u0UFxqTFyDURw2YXmuN
	Y1pQvKh0J6GkUjka8NEt0j2yXYNl/+ilQsbAxZ92VSiyg7fM+3JbPsMYtyN1Br3F
	tNTIaQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5w9gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:49:39 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9fec69475so1034603a34.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525778; x=1784130578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3E9wnYtQkQUVdlCALiZYvZk0M2bJge/N2ttVKzg1N0s=;
        b=UP7bCnWa5gqcFqJgKg2D64ztLHQINzFx0ZtFn5yHuTLHNRehY2q3oqhcpnwGAtPbWW
         AKBFRJvMHPwg9IwGSZh3LZuvKHqtFv3eV7Bz09hfC6nyY55z/OqarX6c/t0GlegBXoer
         umVeESjl916Xt89yjORV3tq+oRcyEIQG7SoWmaDHmJhpevHLZrE7k/e0RsbblV0f4Oei
         FJrJ0IkUkejdwEOTD8lC6f+MmHNoVNQiD16MGm5m860YCpPBraSZos5BFPs7nDPJzH/D
         u3bFB9kn9gdzlnJhzfajyMWpCA4LgzsIWe71T7BFS/ZuaymVJ7orDLHMVrhu0D+It9HO
         2+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525778; x=1784130578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3E9wnYtQkQUVdlCALiZYvZk0M2bJge/N2ttVKzg1N0s=;
        b=MaMuNEmzllEzNLtuPAm0n1KyYe/aOfYPo1dX5vny9yO8lYoKGRYnPue7ytmlJiaVbG
         Gdqb8s3xqEYop5PvS0WfFalw4qoQUDCX1drst15l+TNd/o+b/iAh0SF/v2ysWf1nI9m4
         ecqVou9pawsribdwreT2uQ626eUerKkn7NkvY+a+yOOMGtl2nuuDkGcp/4Jy8aii1Jla
         fEo3B8CZpuomiVm1Hi8oc2i4/O3faAeu/ELxeNrTAbqaoZVwbe9vevMTJ+rtvR9rEgTu
         D2i4k+YjXO7ZpcH5J27FGsI9B7ARL/XG9IKTME+QE+dbi8xELFqta7JDbXIv6n/SilLz
         ov5w==
X-Forwarded-Encrypted: i=1; AFNElJ/EXwcSZMJydg52vw1DUF3sJ+g0PfE/P+URHc0xewyWgrHA0JITQIOLgvowB2jAleuD9kyYRIJAQjLM@vger.kernel.org
X-Gm-Message-State: AOJu0YzKB3+jnh6WMv+OKau8ugmMMg7ZXYBrIPSIy3NVo4dpWnt5KCKN
	0PQYj3UqXwP8H8W0tL21O7b57jn+hyFU66IPUB/F/yg+vMbksoxuoYD4ysun03Dre5sZW46MfjZ
	FLkInPkTrAKulmPHq8Cxv/FgjpJy26Zqbxeo13tkce6PvIGGXlmGrqnVcAQGx5c3J
X-Gm-Gg: AfdE7clnN3nd5TeLkk3Hb+b7n95chI2V3+W16HuMSfXGJ/BLrjLNaUEtmE8JGpa4Rik
	fjC+rv8z1UwuHZXbTDRCx+7L9bpa8I437J6xvJWq8K78S3P1iU99DzhGMNXNGDrm3xeXER/iaX6
	QBWlvsES4x+IRjADEXytJyyfm+HrA09uGFiKObdO0mQ0trdx+fiK7++OFNxjRF6c/RYlQSvAb92
	mfVMS1cD4x0LMuTglkxXWHAPBOvpyxqgDxfGKR1o2HlsMTzOpLi376JkVxqNj2b7mBLVkBe3Eia
	Khc5QlT+S3doLjcUyHHoy/alfvPUCWSFuaWzS6tTMHTFxCv1Q9xJ7nV3//TBc623QqADvXjbjcP
	O3HKTk01VVPPMT6IXdHqmYaSnhXge7X15M8WTM48s
X-Received: by 2002:a05:6820:16aa:b0:69d:fcab:c640 with SMTP id 006d021491bc7-6a36d9a0bfamr2346988eaf.42.1783525775937;
        Wed, 08 Jul 2026 08:49:35 -0700 (PDT)
X-Received: by 2002:a05:6820:16aa:b0:69d:fcab:c640 with SMTP id 006d021491bc7-6a36d9a0bfamr2346970eaf.42.1783525775564;
        Wed, 08 Jul 2026 08:49:35 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb1d1ff0sm17014022fac.7.2026.07.08.08.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:49:35 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 21:19:10 +0530
Subject: [PATCH v2 1/3] dt-bindings: soc: qcom: stats: Add compatible for
 Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra_stats-v2-1-beb52f24f1fd@oss.qualcomm.com>
References: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
In-Reply-To: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783525766; l=1073;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=jcihse7XknEeHdBahZIOmT1iE81AjYNGrMrlfd6oH1A=;
 b=IFQAEUQPS7bRCcTV48BO80qILcvhRzJe03h4RZhtLtKQjRRkz1o4dQvoIMVGnjkjSl2v37nkZ
 XCu81qOEzxzDD34+XZTSz3mcKTH27mYa+sR3AwUfQqlDEmhk8AWS16Z
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: slgG09udedt4z3LUZeiRq9txs-SxkiEy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX2H1/MzNptkOC
 GrwGWPYMc/IPC1qfLcCaQg0DmI5j/+wpDY4VxrI1ajPZtAkxMJeHJ9E0TJqm9UK1HkuqQCAqU1n
 H443/AQQq+To6TdXnpV/ua0zKKFrM2w=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e7193 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ejYHyDfMZPm78Zg7qAUA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: slgG09udedt4z3LUZeiRq9txs-SxkiEy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX90h2m+7zKC1b
 2D9AdsCT3CyHSxtgYnGbnB/UCWIvmp47ldbVX/z/4grssk3464wVn7GC7EHgrRV3z+crBKDVMeT
 AVFjRHjE2f8qZkch7tzNDpWQyakCaS4H5nAgiXZByHM5JGKWpc0qhsCBY++0SSS8aXh+wlPTiw6
 N6oz6THDRZJKfOU6K6vQhIUPVBg0/2DBVzmIwxQZoqhdwNK4MH9oRYhhHu2tmxPWvZK9xn4rBzR
 YFX9Y/9TRxizcyhNWlEv6KeKojZ+dy8MQPuKydxbLQiq3eBBa5dp6UmQgA4zgdtdXJZhTOvkFUI
 0T/tkKzacBtWYPrUliiATIXVBX+FWTAxjRuVZ2jY04xmX6jWGxr5Ty3p9L+DUHggel9LHTQGjnC
 rKGUIsXY1xzn2LCPBJrv+hk+Im51HEe7O9iIp0ScRVZm+Esv6oRxjKSOmsZF1dOiM/UVBKlR37F
 58ixLiJLxZ480DjTYUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080155

SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are present
in SMEM for Shikra.

A generic "qcom,rpm-stats" compatible only reads SoC LPM stats
like vmin and vlow.

Document shikra rpm compatible to read subsystem LPM stats too
along with SoC LPM stats.

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
index 686a7ef2f48af11a0e63904ff979e40d7538de65..43751115c5b4e2943c93d37d3e27c839b4057529 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
@@ -27,6 +27,7 @@ properties:
       - qcom,msm8226-rpm-stats
       - qcom,msm8916-rpm-stats
       - qcom,msm8974-rpm-stats
+      - qcom,shikra-rpm-stats
 
   reg:
     maxItems: 1

-- 
2.34.1

