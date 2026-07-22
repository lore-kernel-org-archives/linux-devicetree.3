Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC45034E766
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712438; cv=none; b=G21MOptM7Gy1peczYUekE6yDBPLXH4C6REGoFc2N9DhdbMgzsKelibJPrzKnjTLxvfWuwkVpeGxUHbV0FZmlDSE7mHt/OVrRh8mensQ0t0DXHnrg7hqsXooU3YYLVDG7cLWeNIKyUIExh1DCpL21ojP6j/KFZrL1sKCdIsgG5P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712438; c=relaxed/simple;
	bh=fa2aG4LS+9chhSCsFbGu/wjgtsk1e/yb206cFj8AyGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ks0N9HmX1KBxn80gVyfGrD6iWXaZxdz0sLtbAVlAxK0ByZWOulZqGUED6WgyTDpiWs3e4INg5Isbl7CKUiOQWPqy4MHJjBziereT0XrweI8BVw8jVWXKh9imYy13kSGjR7fFpqu/R7Uwuo4hzwUItA3+pDpHelAWs+uzBS4nUe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TT4qpn7F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwY1Mwaa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TT4qpn7F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwY1Mwaa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M9DlXS049586
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gkxmfdLNOJUpwYPfIJkn4kXdiPR1BCGkIFMX7SQ4GxQ=; b=TT4qpn7Fxu9pKbr3
	Mh7Ou/DhMBpBfC4/LXy3JrQxrNgjrYNaQAm2shLYW+/rj4qsaUaCrgS9m1vi243e
	omUSOftuCWXdS30l2fDTiurZ5GDf3/jJTTNEyw47E3eoX9eOV6eXghOR9Eypa3AW
	FkeqnX/a65Kxd6Xexu0QoSPOfCr2aZDK0j81bDu7HO9O9onufiIJMzU6UvCMuliH
	73NbQfxTVLaxukx4yonMdVnwzXc8nGIUAlljNzzV7q46LFbwdOf2htLBRSoYKcrc
	MRdxnTXGdOSRkvDsuM28VvP7Yh85eRpoc/00Pq9DrytZzmSlcPDp8tB3HTAFGtg5
	DjBGNQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju2281n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:27:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso15034120a12.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784712436; x=1785317236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gkxmfdLNOJUpwYPfIJkn4kXdiPR1BCGkIFMX7SQ4GxQ=;
        b=iwY1MwaaMu996GlZf1N4Sw2FPdQ9r1p/Shu2ISzEz32T7W4/naxXyE2A9BgkBB61D1
         MJ7piq3ORPNdzdeUpvJKruUKzVQc+BHwQ9YyUXFeH9j6Cr4hy51hRvLxh4Nge6tjjgCJ
         9xBIB74hnoFxFJS3q1lZF9SgejW3lMVDnyWRQosNBH1fM+YFAN9dVmi08ZFcRJw/iqmd
         fMbP8/5X44Yl2k+DhWULYSsuVDmKuNmDBP8eAV2fPEfde1jsPEIAePm5VBLGIpFzn541
         tP3gUInsXvF1h5gTsHKWgEZp53dRM0a27Ba8WBKZUReCEINH1PD5IbTJ/q3om+8ZSV+D
         acnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712436; x=1785317236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gkxmfdLNOJUpwYPfIJkn4kXdiPR1BCGkIFMX7SQ4GxQ=;
        b=F7/+nBs74noqkycBjsPuMSZHDKju20Z0BdMpN3FahAY8Sy7IvDACGi8NMqWKU5OBDb
         s3Jm0CY+aI+b30jq7AcVe4mkhvqsa8wYH+7MI8/eLq4OkamHy7vwYw4fHaiOdDfJdydX
         njkReyjcsIGyBIc+vXcSX6PfnY9/sVoqZvsa2K4cNQuwo1KrbYhPzG2qxTP/0Ssq3oyq
         PMwdpre1pbNEp9ETSTI8ZbVp6ytMqKIZSyVG1lez+/fqDB8G0isUQ2qMmtxRmXTQSASK
         RGxaOTDF4Z4TkOgpecq4Jz3SVEYDn2EoQhPi55sVKNfYhj3FNGbtW86y5ZWF3Qwy8+ep
         EwLA==
X-Forwarded-Encrypted: i=1; AHgh+RooDN6ZhSOZ6RFhnmuPVnidbOgUa3yEJfDzDK8FA5QqAIzmx2wt81uamlnZei0V4KNn6DLn6W7Ul+oo@vger.kernel.org
X-Gm-Message-State: AOJu0YzpstAyfI27jzXAaNHS2T79RRa9vSMW7xf5EeYVODFfAB9oKaKj
	+PuJlSHrpVcvUfNX9kS96xHTfMF7gWw4uwYAIjOSUgzS3pUlKEufYonu7OzvoVRNcrp40JlzZm4
	DRVGj2EpxBT9UxYCDEtoElOEWt40T+jk6ZTahfjnp/VYUoWM8CYPaT4P7ZbeRd91R
X-Gm-Gg: AR+sD12Yu6jhz1TVljaBnn68PWxxY/AGG08UwPJqawhPmZhBe9qduxUwJThjLwsaKmC
	tlhYn0vOPdq2EX1OQiys4rgLequUxNxvbCnnPdEcCA6/8vmZ2Im25ieMYZ+6UC7GWJfhhVRUSp1
	QnhaOn/nusMxsqYeMz+x3gvRXY5jXOj6EUuQxgAjBkOQ59cuWr2kcwNlzKqRbaqA0F/PDiKnvk3
	zFaRUgrZqi1sIdZM4mcgjPFJeDb9UZJJTtiNpOqPao+AlxA6ln7QeqnIinMwnPkGOdSoQpl5U8Q
	/dXidjPpudfoYbZq6bYchEUvw5TjVU67H9qcc3dspJuEwIMwhERdeDbvkUGvjRymuDLp3H8TOjA
	jhWPzA/9npJmzU+ebpYZ6LaGkfaluqmES9vEw7OgTvHdrbRFvIec191AOi8fyIXqWW3qlH7oS9w
	==
X-Received: by 2002:a05:6a21:a8b:b0:3c3:83e6:c6e6 with SMTP id adf61e73a8af0-3c3ad9bb9dcmr25135436637.55.1784712436476;
        Wed, 22 Jul 2026 02:27:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:a8b:b0:3c3:83e6:c6e6 with SMTP id adf61e73a8af0-3c3ad9bb9dcmr25135406637.55.1784712436026;
        Wed, 22 Jul 2026 02:27:16 -0700 (PDT)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f18f08asm850677a12.21.2026.07.22.02.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:27:15 -0700 (PDT)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 17:26:28 +0800
Subject: [PATCH v2 1/2] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 x1e80100 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-devtool-v2-1-d7e609ef7388@oss.qualcomm.com>
References: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
In-Reply-To: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>, kernel@quicinc.com
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a608cf5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=94x6OeD_fArCBOibklkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 6oJY-AwDJbyl7vKfY7IcV0jnJtqBC2ns
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfX3JvCh2QzKM1i
 Snm0JiGMKC5jzYwS+8cNaiq1GeHtixXaOwTuslVE255OhB4a/lJ5Y1jb5CFSCpeKuXrih0af6FL
 izZYTPn/6b5laVV7xsDI8YLL0mkjdWo=
X-Proofpoint-ORIG-GUID: 6oJY-AwDJbyl7vKfY7IcV0jnJtqBC2ns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfXwINNZKCkJ0dA
 s+xnL9tBpcEFmO3JIZ1P+mxsWjnXZE/GCI3N/JTQKlZek0qXZa27XmZ4+KmhKsgbVW0XvaBDsBC
 wGHrHX5lxPr+jTuNw510aW8V5LMgFF18hjzinFyj+dXq+uKvo23P8piK/riJuQzS+JZz5LdQo6b
 GIsJh0o0RT81qVMdhie/wkB2IGFMWLqlekY7r5kmxnmxrYnPpVEsH6PoFS7CVrM2oLBVS7Iswtj
 9j9dqkH8MQ++n+VuTffDhR3PtkLLsWIO4qP6GzftXbugUQtzG4NOASE2NQZi5aBH5NWLu+1Tb7c
 IosCRH0/WRQn/SszDowa5+prkw/9a8vQ6iXGNJHEFBE3yNoIzowa9LCZTfLvzaPn8TruRw4oaDR
 aqotaOclf4ZEFwaIeGxtsxoMrKwaoWQqLqGfUvcnLY7xxupf7z70gMcy3Yfuu2MsTRh+1VEAtjY
 AMQXUGyEmQED1EGtxuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220088

Document the compatible string for inline crypto engine found
on the Qualcomm X1E80100 SoC, used by the Hamoa IoT EVK board.

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 92c3ba6eae13dbd8a6a448057e942a08cc3a3ea7..07d6778a287631262282d75c0d233919f4241edd 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine
           - qcom,sm8750-inline-crypto-engine
+          - qcom,x1e80100-inline-crypto-engine
       - const: qcom,inline-crypto-engine
 
   reg:

-- 
2.43.0

