Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE72387347
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609484; cv=none; b=I30VGLsvdNEyz6EBM6wffKth9SEE6OCP6eqrCAloB2tPM9KVqeeZAAqPT1TTPLxrBo3ua+6A8dxOfH2VdjKHRqi+SKq55fh/geZIdbU1cAVL/0spq29F1zwaqPYbbD5gqGdgyX3koYSAhHxi6Dpv/KBwa9ufAC5qg13RvjgX0OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609484; c=relaxed/simple;
	bh=CojWuxuD9n66r/EUNi/f0S5ZcbJmIz1LSyhP0wh4IAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nPQFjm9bcOkCQav/IwnGUGGtsb55bA7Z8ga7yJnktew/KqkBv7Dgc6nwLe/GWbFuX0Ye0aCjqbPy0iNn9wPH7MKms4ET5cwNyW/ltlAh/IlLE9QYKdwMKevAPV1ynvvbl51adeHVUvbAXsuPCto8P21ZdWb0VZzMl1/15mhgOOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYhSykBs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ipkUmAb3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYhSykBs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ipkUmAb3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCrLE3978765
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C2nBVq1rdutHbNnIKqLSxvl3wO82LVN+nGH96S4XIfw=; b=dYhSykBssctILex6
	b88/heH0M4Tss2BMXPPDe2bDXAYbcUgSovCBlKXvduduUYVyx46K4ZTHpo4owjQ/
	9gi9eGquxNmtvt6TxBIffoEW4MGtEWqmunTVVFuADO8spQ6A1RfWU4HQyCSo4VAu
	qES+Wq5r9c4CL9urQ4Eff3KFHiB+KTzk0i2NG8SUtBVeYpCaVjbUCODZ24oL00yn
	I3lyuj31obLFZWIyabBIhd8SHlKsVfYSaXM+sXSKcrxxX6wAIEkDeU8X5RlVggVh
	4YCbS3pyRGMpR/PsHUrwAGLUSanftT65a/foduu/dkjKVoS7prOqOZqN584HtmHd
	uea62w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv42d3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so7044643a91.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609481; x=1785214281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2nBVq1rdutHbNnIKqLSxvl3wO82LVN+nGH96S4XIfw=;
        b=ipkUmAb3HPHihrRD7phRD0NtccEVJYT/b9t7P33JlcOdhVDOzaDt7BxyGb2fiaSEw/
         EuUK8XMQQDxZmNN9KMML6UxlEogmsMdpfc//5T4xfVn3xu+8pKHftsEBT9jEM05xvoW8
         Cn+O2iqR93lDAVGwtXimv7qcWuX6n6ETdUoH4+ag43rGz3QUs2NeKfaJFAsk9oknuDuS
         kQLr2mLNRQoAloPT6XJsRrR0L23P7LXeAIkb6VitH1PHLXHM5BpOUDhwF3sm6zhZ88eL
         gVokEZu5057NS8HmEU37oeZkaaYD1WXSvaaExoc9r3AwwI/EV0g0IoxbO/bXMGD4fNT4
         gCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609481; x=1785214281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2nBVq1rdutHbNnIKqLSxvl3wO82LVN+nGH96S4XIfw=;
        b=hdMiKIlp75yxXc0k+SMcWLyN3gPJKnU14lq/T6mpAGtdsu7EXN2WrNEbzMWAeD+tWV
         1mr1FGVGaC/NFxlMbATUj4Cju8du1aMpwYKbnu1yYBSqy45+cdW9GE26BeG3aaokg2F4
         LUdRYzV1XvmrksRFYoivaPLwbZhua1dJb7LVlUYOFilAF2zZAlIIlzrv6hCd6gQwBw+h
         LJTEQyPxRUBMejfL4SbCakcZnNeMIUB2V7Z+mYEJEMm1mnkg7D6AEtGvTRoJJ5Jf4+ws
         lkSu8jgNa8jB5rIW5NhhDTAu14QyqsS1nrjXJxdq9Qp6ITvV2iMs5u14cNPuP7fBTDm1
         PfCw==
X-Forwarded-Encrypted: i=1; AHgh+RpAwHpU/qvEqRmqS+fLWSlMc018aCIfrrgFIY5j+ObmKOWf+nHzsYfV9fgdRE7UnYyu5gL61SYv+q1M@vger.kernel.org
X-Gm-Message-State: AOJu0YwPMu6o56InvNuC8A5ppH0d2dOyxsk/6hxw7XdcBtVoL56ydITY
	TcA8JkxUBa/TJqHf5Zf+TXiMLroo3F10yrmS8HcHdCqlECKjvsIolMat1/+pFc1sEY0m5T2nhKE
	Bvo6kdsY45I+n3PR2T3wPrw+Sex9fTa2wOwOE+YjixJDQ7a7Lt/FHJEGnGnLvxQ2U
X-Gm-Gg: AR+sD13IADKx5+EXrh3s6PE387zm+77ZzBUCDQV13s7xgAEzk8G9JN37Q8ii01BlQU1
	ungfcSMGfWkdE69qoYxjYejCd1HabFFB1NO2mFTzuA84wDFliMbzcvxW7b5bnFwQGGcjO6SLyWk
	M15F1zUbFcEvcuccZzmLQTkfnTxprrUY8PTjaSRtSUpr1HX3kfprD7hRNacGgZ2hQRuqC2Zt8C7
	RljHDkDcnmy44JFtnwc+CUkyN79ukOo6ubE2Q0ltEO7C2wXnF4qgo6zDE6wScSIehxhoDmMVMgc
	KoBOv1lfIyXHAOfOlMkcKZMbEWbx4j3UT+mzrjR4G1m8SFrW+HBE8EPF+YzVDumJIpL44oTbtyW
	yxhespQB81nL5HOwJAUbbJxWv/HE1jMuAF3x1JMn5coB5419Wq5ORPb8=
X-Received: by 2002:a17:90b:586f:b0:38e:6b76:f0a4 with SMTP id 98e67ed59e1d1-38e6b76f1bcmr10802631a91.2.1784609481016;
        Mon, 20 Jul 2026 21:51:21 -0700 (PDT)
X-Received: by 2002:a17:90b:586f:b0:38e:6b76:f0a4 with SMTP id 98e67ed59e1d1-38e6b76f1bcmr10802608a91.2.1784609480573;
        Mon, 20 Jul 2026 21:51:20 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm37963183c88.14.2026.07.20.21.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:51:19 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:50:34 -0700
Subject: [PATCH v15 1/8] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kaanapali-camss-v15-1-c0b1c1167c5d@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
In-Reply-To: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Hg73ycJfNvLOdO2QFvwYWBi5d7I-Pmst
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfXzDq3tBImgeWD
 4SmgVNX7fN1f6CBJg9kvSrZhgS1Vdd4/KVOEc1ITjk3ugUnbsNZQNwMY8FdXc0RccU9PqT1/ZW2
 Iwuy7144wh2FqG/uOcPBxaVTO+fWflXrfsnIKotq05bXQDtGpOkm7zbdU3SykiMFqq07n6G7t72
 qkRqYRA1BHuUtFN1WxXBZfHLzuVgq/Pc1aGyJeV4cAAsjm8PvkZGKsONZz4/TaMYKLnTZXcQdEt
 AyKw6/IXRTXV8EdZ51gyuMOR9VLBWsXxwRuUSgKKfPCSZeZGI02r9IG0yEwUl8LCNiUDbqlAg+R
 3xuXlu/tglTMBL90CDmj1YYmRRBwgjuejJl8SBI78UUF7YslS3/CUbds8OlQt2e2vPFaGxsSNYN
 t0aRcS9zqhag/zniJizL0Rs/DHct2D4paDD9QVm6ewcN+8Lyd+83vgxeobHbbQra1b39veWRaJh
 9R4HYLhqo7Hapww47Zg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfXwWJGo7tW+9vq
 JYDGSAWSAo0KZ0AiLjX/XnFmThzh20VbuYY/FtshYXETb4qEpi9mMbUVwR+qfI/HZY3a4985PlW
 Uo84WZ5nRvweDZ0NKpZczuycUX+Wf14=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5efaca cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8sc_bQFcTW-iTt5i-CEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Hg73ycJfNvLOdO2QFvwYWBi5d7I-Pmst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210046

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 880fe602945c..7943049834f9 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-csi2-phy
+    enum:
+      - qcom,kaanapali-csi2-phy
+      - qcom,x1e80100-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

