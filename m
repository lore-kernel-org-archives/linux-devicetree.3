Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086431;
	b=AedX0J93X43VKUgeLm2CzEVLwCaUkzNJNvT00icWgMVVpNfsHU0KUBeXpA4kF4mj5ONT
	 DhTZNXWfFB+RUpCg6wQf2jx1Wv9wKY8XiLiJ0n35RK2unjMwC0A56AWR8BQ8kjwXGsQ+X
	 06TVSGImCmxuIH2fzo6tL1XGWp9rXDi6O/rfw5p9u4ptrtghaBlvvOb3x7k4UT1GGcPR/
	 eDGM5U5E4LEOFErrd2JSTrcPWiX0v66lnGHEwQVm5SkDQ3JzozAzIgeUkAo/7qy4GZAUM
	 0vxop/HHRnqQM9umpcQgqiSVwKikOUksZU+bdTLAX0TrPUA+KiypjSTm0cW93m71g7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mydu7/v60eKg1fWnzz92JlLJTuRpZkA0odLBmNL740s=;
	b=VsoGfOfFCtIH1KSyNVs5T8oSbmTwWkmFTgQPPDzRXiNTvdkk+uuoJK2EHLS87cUF03wF
	 GI3SYxr56UPzqyfA2u3d5gJJi1/4zY/JO/ZVxL8dyuddrdauyLqJK2wv5RbpVMsFD5rPt
	 lzjboBs7dHBbvD9MyTfKkwrukPszLrF/GJ2LLsOqT3HaOuGlSHd7jUH4qAiAQWexrhXVT
	 uMB9FqH2sN0wrSMUVD5qhuTMr6H5UVB9xXiY4vIdSJ+1K0D9aP+DIiHACcLYKMjZkJfh0
	 dmrFaDyHwphQNvPZlSDu008B/u2mVPzCJXdBrMZXLT6L/MD4TlsGDVZ7Oa0mfmAHyrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=puo2TPrO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ettIUmEW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26568606A325
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26568606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=puo2TPrO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ettIUmEW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Z8QG1779747
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mydu7/v60eKg1fWnzz92JlLJTuRpZkA0odLBmNL740s=; b=puo2TPrO9ZnxtzoK
	480dMdguwbZGkc0BBkFiVPMPQYfqu52UY71Cq1vtN+82NXkd91t2OzBLToU5XlVV
	EkwexV9XX2Tb5hV+lupTVN7ReCio1QIIw6wiS9Tz5rE/7plqoFJ1IFOXAZO0100z
	nKgUq61jUv4IxK5QMFULHWsM0HjKzlhycZQVrNK9tY6BqHGnCeDLE/zVvcLbN3+P
	snIGjNI0uGz8W4omPJzGNRBmTdobp5/Qg58C9U8VspQ3gw4sRr7tAcct0qlxW/Ru
	yyuhOVvGNYKPbAYmgrNYNEw/r73lqNO+Si9VpjPU7WCLLNQSi+DqLWR4CwgKu0SD
	gs15Fw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt948n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:33:49 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-451d80641efso7401366fac.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 00:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793086428; x=1793691228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mydu7/v60eKg1fWnzz92JlLJTuRpZkA0odLBmNL740s=;
        b=ettIUmEWqkItOi1TkFwZlAxKoR8K9W4GGwFGAGBq02rn/WTwuHL9WEuEP8fuuOnhSQ
         gy2+NHVoKC8qoI0kGux/m4wEQ1SD2gjo9LKcvTS49rJwhh0qBcLQzOqNCIgS9zCQ8Nc6
         L1Hs4Xof1jU7S2jrENx2Xsza7E3BYBfVk/rs4i0qFt9AiBVe09XLkoE9vDKLNstrvw3Q
         Tq5UQbQMw/Pp2FxbaADtGLHRhavOJBFvZKnDNPKHuytrKpxdBIjwUi2/xzxRog1KIW+f
         GXjxiZjeSj33LiHFFc4F7iD3nq1tjhCOW7kKgX7HWjeN3nahBkXoJDuDHUMSsudVXlTp
         ephg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086428; x=1793691228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mydu7/v60eKg1fWnzz92JlLJTuRpZkA0odLBmNL740s=;
        b=ZZwh8E7fE4rniFdFMYtnKpS64jNHWhEiHzoc80sbBrG2pFBDa/t6Yk4iHI4lVWZ6gj
         t7HxTu/NA8bOB07mRuQo6ajxRXFV44mqX2fAOrNL8Kpqun24RSscXLTZXqh2k89TiCUa
         UPuPLodCvgq/onjwgmiipEEuUNwVxG5AzWyg2UcsgP9TcJli4ePp0bN+jkwVwyJrs2V2
         x+z6UH2XZhhLU1rwpCzXtzyP0MFdHBT3eVVje+Jv1TdC1c5ecf9AgQ+kF9L9dhimdfzK
         B7EZCefYRVffm4G+ZlK3rDCc25iQ6nJdbmBYmWt3Jl03UlGCksbO6SP14FHMzkwlF//k
         BkkQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3+Yla9lQ1f1vq5pwANbyERlWV73gXM8qDnvB5PuBEfTzCRafTaagpgizLqAiS6tFLy7ly7OPf2RAy@vger.kernel.org
X-Gm-Message-State: AFq9FYJXJUAXmZYhdTVaS/mRBCLbR49JuXG/Ano89hitZu1WRZVG7In8
	sgpVSOXQa5EKID9v5Yl8IUAMqFz15w4ogu5DVKjhyT0LOUW1gxw2XrSNksFGMWqhxXm57MFSX6o
	BMVEiba21UKzVecirr0XRJKWMSN4ZR0EEXiiDvqcEJu4w66Q/h6IMomVUU8Hvcn2u
X-Gm-Gg: AYBFou2lY/QyrPZFWoxxVPQim4KgoID99npoYwBcyaO07NMgPnPT8KvXpeAC0QzyRkL
	nESKb4d+JKakxZoQY6rh+yuOMJO/aOmAxa8S41Xt7rVhavL/vA+BGHrRZdr0x1NOD3p26Eb/n5R
	o59HnwTqKv1pdzZZpFptsY+9sUQPnUXkCaqipOVJXeF58d3EMnSf9ngicRe5sip31s1OKgdfqjN
	0ACBUhqWUbShaYpUKGhpXENP97f1SxgUtj9J/Z3BQ40WUNDHp2CnbayYcNplykbQXLePYkgHtUl
	JLPVyhuwXyTbhPYhhgeqjL3JOIquf4nXcZGBwo8cGAXwiSDAUR+rGGJQnbDXkRpRaqNzsgGTEOx
	QDrkvsBKq3kSkhDHq5DcjtrImD/jjiJ6nfvzE3CqN9kedVkwMy6ICzEgILzyArlfZ
X-Received: by 2002:a05:6870:4690:b0:494:9254:5b75 with SMTP id 586e51a60fabf-4a83f492564mr5150374fac.27.1793086428374;
        Tue, 27 Oct 2026 00:33:48 -0700 (PDT)
X-Received: by 2002:a05:6870:4690:b0:494:9254:5b75 with SMTP id 586e51a60fabf-4a83f492564mr5150357fac.27.1793086427823;
        Tue, 27 Oct 2026 00:33:47 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm6181923fac.15.2026.10.27.00.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:33:47 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 00:33:34 -0700
Subject: [PATCH v2 2/3] firmware: qcom: scm: Allow QSEECOM on Surface
 Laptop 8th Edition
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-mahua-surface-laptop-v2-2-7dd903a12d22@oss.qualcomm.com>
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
In-Reply-To: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793086424; l=1019;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=wNF7GM+GdxYCWdEaZL6S2MWmKjl1DuHJFAVWJMyUK3A=;
 b=sxTRZvchOqzGOxsqy3rNazQ68L4xmxe7cYMXP6mqGCxVJZZZf3jH9mGgIdHDfyzrrjE8YaRCp
 f44seOeKIdYBmhty9RNSeORb6oMZxW+15uFCR15jjdom8aTM9iYNecp
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyOSBTYWx0ZWRfX/T4g1283I9vJ
 JyPrUuI/nJvWwbU55xpeVDqGldenrdPb/gIvmfa5U7HERCQ9lEut9C53hZ2abkD/R2dvfOPDXIE
 QuYY6wPHVCoNZipmJo19SA5myOg01PA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyOSBTYWx0ZWRfX8nHDoEOIwiZU
 pSHZh2y+InD5c6T682kivTQurgwCbLxpRPLzUylVFYihq1rEgxq6l87y74qOd37mksxzah+t0kx
 BdTzQwgWTws6IRI5gY9aTZhpvDEwMjbOf85Csn6V17jtV10wR/q48IsjzKTl/QNNoPeOhhGJSd/
 bdY5AF5h177HJBVGuiJRT+Uk/SSdmJCA6jE6UgaLgVbxlXtlGbneGp0u243QjqYTxUy6zUFPAhl
 8bXYjVG3Oks88NuLhW5T5+QotWCcS6wVYlx5iXWOq9W6WwSXHvbeG/dLdW7JdqHE/ic1DSyDI7y
 +zn/JhABsHTMb/hzMsfwcZB4p2ifRfULw2+Dp4b+uY3Tz2DAepGdBovxGM0kF4weOZLv7C+q42Z
 6qqyoES+3/N7p8t5BiDc4B7PhKnZgp2ApWd/BWvDDtNUgxJlu4PH2ts43cCXOYMBr3Bls88tQue
 hTdaddieP0mGHRsaJFQ==
X-Proofpoint-ORIG-GUID: LpyrooUe-bxv_qPSLt55Ro-Pu-V_lpW6
X-Proofpoint-GUID: LpyrooUe-bxv_qPSLt55Ro-Pu-V_lpW6
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae053dd cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=iOO-S4HMiWNIuKyz5uAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270029

Allow the use of QSEECOM on the Mahua-based Microsoft Surface Laptop
13.8" 8th Edition, giving access to the UEFI variables and the RTC
offset stored there.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..30d87fd939e8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2255,6 +2255,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,denali", },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
+	{ .compatible = "microsoft,surface-laptop-8-13p8", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,glymur-qcb" },
 	{ .compatible = "qcom,hamoa-iot-evk" },

-- 
2.34.1

