Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E64C2C08BC
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294594; cv=none; b=iqKcrbn7xiRXUm48DEjQNkIwqB6ENwZNdcYmZj5AGyI9an0gB2hmo73Yjjgoap9JuLKrM4D4YrbuqxzDhIXTtORGIS+JiBWZ07BpADQjBWPZAN3c//O88YeRsRGhVO0WmIIEx7j2PmGrkiFQRz77a5+HEKW6oIOOh4LFejZCQJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294594; c=relaxed/simple;
	bh=9fLJ6pohfE4ua8gQm+s3osBjzHmnBIXYoZ7LvHwHEU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Faei0QtmeUb1KSM1W7ufyKTuc0eAeeQUKRD5qv6uyvR0AoQmTJ9/7s4QsEX3CzARCZM/UggWv6Zrpo0t1W42I+YOiFB1pofdP2H13AO+RAVaA4VVljRqy5JmZxCEC5gPxALjRlegpLqiFz3SoVFG5Myk5VCgJlg7uoaxJ3DjWlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaFnbRwM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h9eAD40f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaFnbRwM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h9eAD40f"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O7Hnf33753451
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 09:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T7bOFXZVwlQEkn2VS3KF1SyH0v0aXor2LlSePWOjJIE=; b=kaFnbRwM6fH4hEQJ
	vBqRqFDk302eKJJhBka2JLv35VeCMjvGgx95OmerNEqfTxW++1Oxliuo/kt+BS4G
	mj0eyxPwKC/2Ehqn0OuGQj8r0Op7VYuU9w3apWUOfkqlP4TXLfmkdhCo/CRETvCF
	ROdhO7gGFM1QHuIGCsbUgZN5yNyC4tUM1JoPXqto4kDERQX1MHwRxlIch1mrK+QO
	+9i75Pq48ZF6xLXzp5mpFvT6eXJA6wTfarTdQby6y4dUSlxvJVNyJaGELOPDhCZg
	frEaljHHvnT66BL4gz/eKU6QLZ/LD2Ipd78oBb00QxtnqLWtKb2kqaBt6MWCsMaU
	1xJATQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqp8j0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 09:49:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845a29d8c1eso871112b3a.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782294591; x=1782899391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7bOFXZVwlQEkn2VS3KF1SyH0v0aXor2LlSePWOjJIE=;
        b=h9eAD40fjuhrryySDrx3QCGIASyLFdIeDRAMZnd6TzwOyZcU7vFt/ajYT6VuHbuyiX
         VIdFa1+kl8W1p8zIEsUrrZ+/cAJsXptkszwfzcnYVmlVEpTaxFmHdAWw3AKQkc2iSQqj
         ZaAfLReda9yakiBvWwTFMiuZonCWAsS0CHZTH0anboPhBayyfy90qU7Ffp5SYZ5fOP2D
         Rn6ZV5zh2xyshvlqrrltM5k4x6PpG1BAmhcj36hzP2Be9i0QahvkxRFmO8FPefhv//m9
         of/MyBoU9Vfw86mpkWx2w8NXdai5oPIvF6itCW9wU2iFwBXicjlBMAXSubn2IsSTrkym
         mVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782294591; x=1782899391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T7bOFXZVwlQEkn2VS3KF1SyH0v0aXor2LlSePWOjJIE=;
        b=B5GbYwJPAZF3QjkEb4KCsi9keNyp4jrmYMSYEvyAOTW17Y4ueqrxWpLIZt9r0rx1yL
         1Sabw7RnDGbMoaMinP6JhEEQdQSOPyzSxzGC1DWzQGZlxgEZgIMa7MUIblChX61yXwCT
         7yHu82LrLN3mFCKjUoYe5a56uU98Tsbi2K2ZhczzPKCW25xwrUEGedlxcxX/K1wrcWJ1
         t0zOFXSSkBtPBpt6dPsE149QDf/TRDRdXBt/yVuMh7WZLohAMDe69BjeI1m0gHSNUqgW
         Fwa5jfx/ONVIg3tf7VozzWrfOlidoLUcWjka78tXYaf/uKDo/5tkeYn0VeNVjtpPpv1Z
         hOKw==
X-Forwarded-Encrypted: i=1; AFNElJ9lOS6l+wxsDPrhRIunrJl3fNIUI1xoA+Yz8U1q/UFQbfF9zJxQuEmysf4cMPYlp7QP2o4ZMSQtce9Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwaE3A1Fvjs+Q0UP61WplZKmgqwjNVnDSHTa7lDb2npy4Hc+ApF
	HRwMqwEKKgraVGOfF4cb0jOaBEGwc3+vzAejXu7KxAELJffvmA0Ed442ZUdxSwitPWc4wRthjtB
	FeqtDwu0gCr3MgVzPKwTFWsR2NcMArHbM8WzEsZ8JL4/6HkC37v6d0q0IN7Oti8jj
X-Gm-Gg: AfdE7ckVFfUqzd9hD/2ydnluG88KsYb08Lu+wNJ21FfaFqzZYgjRi3fVyhFadaPRDrx
	C0a/ZdcHEk4Gc+7MYXLbaqalA1LsEaEkoNjETv6kZZkQ0syygXodILUpEkEl2vMsre011Ae3nmo
	KipRIS0Ws4nXcqsmB5JOr9gFkylItuN7vBnDgVYYoyBciRc6OlcI5EyPF33oJgUvvQWkvX9YJ1O
	9PMtc1AXJm5HhQ8Wx1pk7UyzP4vFo0CB6gY0+WzbeuujQVC9JUgilkObbkcoeKCtbyY/VVIrjOC
	L1nlRfLe+0cLZIH0RJVbzj9SC+GgpN6OgU5GbMxRt9pc87DepFZL3d16rI3pFIFaXXzLUCA65zr
	xqywfbMdB08heRjCJ4S2tKcRYd+vP9+qAub4YO5db2HSG544ef2eGnXDfO687GfyBnvBdsaKUeg
	==
X-Received: by 2002:a05:6a00:3697:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-845a26dbe9cmr3498750b3a.4.1782294591275;
        Wed, 24 Jun 2026 02:49:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:3697:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-845a26dbe9cmr3498715b3a.4.1782294590828;
        Wed, 24 Jun 2026 02:49:50 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb7b3sm2161302b3a.13.2026.06.24.02.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 02:49:50 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 17:49:25 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,coresight-tnoc: allow
 arm,primecell-periphid
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-fix-tracenoc-probe-issue-v2-1-786520f62f21@oss.qualcomm.com>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782294579; l=1201;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=9fLJ6pohfE4ua8gQm+s3osBjzHmnBIXYoZ7LvHwHEU0=;
 b=mGk9CEe6vF0CIKtanKdcmqLnLG+miKmjeIkw7yFjpXCGIMYnRRRCb5BAo0RXtksf9cR5Ymdzi
 hCkh5FUOOSkAfhl4D2GLa+9m2EIf4Ba4AMjuPUAmLvpwKXDrJuMxMvi
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: sZdfXuvwRsWmC35zO-mucPqNXQ0OI9tX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfX7LH6DGlNkitS
 oKyDrlKbGVKlMDcPjO8439HsS8caoeFnOZcLck9c4RevZ77ynb9ulCcrQl8vfh7aHjhR951WBzB
 Zb1iMXMIp6/9U2y/0zptshQ5k+AjZ8DRUgVX4P9g1y1oBIWVOho5TF0kjO7y2pCkuFjCrOX40Ft
 gMhWDIdjXKWCLTa+BPiLcQNuoCC6M7mY9qdMVSzMY4CDgMj0WhwUzcS/7x5XLPCLpN1HmORW26r
 yzB9vtSiUObVg36tlVUmul2DxpCXuN267aLILXsGHE7Fs1GZC6o8MAvb2WqblOKcAd7+S87ZSKq
 ksM+4ZMv5SUKS3B30FVr7X1EHKLn7+AZ23/kuuEn+vsTpcc7y+xoaRPkNRcpGUBlM6cupAPRZct
 Ijucecy2Ks/IYJ4bADBv8fO08xlXlw==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3ba83f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GsJ7H8QTZ5zs3khndVcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfX4KayA/qoqBcL
 jctGgeJtzi+BrWhj9pXKURojt0AkqoYNZIgby8+tGoGpmP33muwWkRfpwmWYOJrqrwm3CZm3ejf
 zN2FuQlThrLqhSvDHTwMBeW5SV9VQj4=
X-Proofpoint-GUID: sZdfXuvwRsWmC35zO-mucPqNXQ0OI9tX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240081

The TNOC device is an AMBA primecell and may carry the standard
arm,primecell-periphid property, which is used to supply the
peripheral ID when it cannot be read from the device registers.

Reference primecell.yaml and set additionalProperties to true so the
binding accepts arm,primecell-periphid along with the other common
primecell properties.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index ef648a15b806..9624fc0adfdc 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -32,6 +32,9 @@ select:
   required:
     - compatible
 
+allOf:
+  - $ref: /schemas/arm/primecell.yaml#
+
 properties:
   $nodename:
     pattern: "^tn(@[0-9a-f]+)$"
@@ -78,7 +81,7 @@ required:
   - in-ports
   - out-ports
 
-additionalProperties: false
+additionalProperties: true
 
 examples:
   - |

-- 
2.34.1

