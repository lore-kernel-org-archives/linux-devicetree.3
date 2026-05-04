Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83F83E0C78
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 16:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910819; cv=none; b=B/dX7U/4g8mNM62b5N+1ZuvLKHEUK929TxC60qP77JFMMV0h+mfcxJQSumsFB4jVvbqkFJcSvyYdqVB0jydvH1FMBuzCp3SkjZMUGiuPJQZGDGzbr9mYIWTy89nEw9w3IGJUBC2SDAT2A3ZpepFpvi0XAvmBfmHQ1UZnJ1KkL8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910819; c=relaxed/simple;
	bh=4Huk0DuHaY6HlT4dVeeaD0BtO+3KsuY9qan8oFOyxcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u8mPmZuAPQKcd88XbOfEugn+taW57o4emAlt4SDlDShJ3KEOlN0DuDZx533l7/gejTLRy+8TPixN/w5pgAhoHI+vpmsKB0S3kyv2yJE5aV92N5LCe1n/63/lBy1i7b8oqLKoQ9Q58fZEPOGOj8ZEJyA0pH0GpFFBL9jI8RF76Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClkvGiL/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzMGzVi/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClkvGiL/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzMGzVi/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B47Qt636014
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 16:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V4f/xh10dV2IqVEkDLTSJP
	q55daffPtZsIDpKMLuN20=; b=ClkvGiL/RuQPcbN3QPA3+sU8Pqk/C6gFjHzXjH
	EuUPA5kiIMKmczotieM/X0w5o2aAvP0X14YhE1tdpxYx8z1bdjiZZ8XFaqsBHZaQ
	cxqg3POTdd9Br3eRi6NzcP35c6C2EydZ6QlHnnCb/7Im3w4ppvY2gJ2YK1RbuAY2
	RjzH6bQ/5YTUMM1lpvbvQSZSZvdxRcWADacv4iIxolyojHMQreNapp5YEGcVTDq6
	1AtxpHqNBPQdoYYdLVnPmguDVNJl46fzMKM8Z9GxhWhou/jTAChOYK3w+R26llTD
	9+Y904Uoaa2cBEWHBWMvHDH/bBgj57smr23hOw2tTsovUEOQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsx492mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 16:06:56 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-479e99d2aa5so6044225b6e.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 09:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777910816; x=1778515616; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V4f/xh10dV2IqVEkDLTSJPq55daffPtZsIDpKMLuN20=;
        b=dzMGzVi/ET+hD0EosrhQ7hT+mdUM0y4IZkOVjydL6u5lVMzJCae8gEX7i9oJPcx8R/
         e9jEtFDKFsKdHYzDSGjxpGhVucqC+g+kLQUzvLs6EYDiJyRViwpXNPxXeRg3t+BhDZQw
         moO19m0Ut7MINJowZWUK50vAsIqhWS9MSaLOVkJ5mlPVNUcurvdZRNcnnHEViasXitOn
         3Q84VWU+FCMcXdMm0Q+jMK1Htg4L672JskTVc/Af6PJ1SGP9ibobj3/8nrX+9tYZcpGD
         7r3Ujv5B95AMHf69A5G231f6vfLBXMQaAH8TCC0orbynWJ8nbYAg+gXQozp3iRpIcL3e
         uYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777910816; x=1778515616;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4f/xh10dV2IqVEkDLTSJPq55daffPtZsIDpKMLuN20=;
        b=J0Jur7nrQZcqH+6JxYYGNgl19LDpZXRtgfnqGzcB9oGEeZznFgR7LYCddt6jGeLmHs
         He3ssDm7w8H3B3QM33za25wCAh6K6KXRkIXVMjaHdeeUsf0KEbl4DzlTkM2ylU73Csvb
         gjyIX2v8LrUvlkWWRGrzkxnynek3+ocEQh1RFylxqCrxUHGcMyNmd+5WH0IUKoO4PQGr
         UOS4Y1YJR9Nm2vKt6m5P56rJIiX7fphe/bLdZq4ZdASDbduwyOt/Fteg0IGp0Cu1gUYK
         qMgopFfiKZaIaHzvM02py7w4Fxqoxa6UnBEAcv/HZ8oZXA95x+vR45x0jB42FPp9Y4ed
         +wDg==
X-Forwarded-Encrypted: i=1; AFNElJ9FC//p1Z2ZTe7+OorKGTTjg26Fw2FgoHARk+ZUatEgfWP4gUW58AnpCiOoLNqeykXl4LfEje59Wjc7@vger.kernel.org
X-Gm-Message-State: AOJu0YyIgNd29G1SScWruAatAL7/SCMQDhxYJGm7z27UI0GcMKhiZhcT
	oIjKwBKIdQRUncOVMmx6StFT8sVfQRciBml3KfY0BjtVWxxzxz1VuVSehs3Obm49j6j8CVDe7s0
	kkJih18PAMo7AWg7SnqpEQ3jaMCpnkStNecSUWUleq0++6bXto+2BJU+FjxjpIguE
X-Gm-Gg: AeBDiesjH/xuxg9DjWG4lEdsNbyjvuE7Xyznxb/NqhCVOAbl8BlQ3E738dkn/CSNWzw
	rKdJb9CvZhWW4pXEMzHPnQJUKEWYfhvndU9pVZb6cXL2LaCH6cQYLlSDE5vCKVY2yvCWpukDYsU
	811LcY/YRNNeVzjLMRhzt8DziVPSi0KL7HIMgkXQzJZ6U0KrBpJLPjMzJxYPrVkklrhKkZCd/XY
	AEFOaddHXAMal9lNUiLOJaDliyhmEANB2oy6J2zvF9gF18s4DaL/Stex040gs5hTIfVlmCAQjal
	BaiSeqDPaxpM3o4LFusI0Fcy+xQHg3Db5L17IbUZ+uIrzN3oRh2K/ZlDjKe2+YYks2yIhwx00tJ
	cTBxeMi8yFQ9lOUKblcp0qA2VofGQUmMMaDUslOiR
X-Received: by 2002:a05:6808:1446:b0:45e:f0af:5148 with SMTP id 5614622812f47-47c892315e3mr5222655b6e.30.1777910815964;
        Mon, 04 May 2026 09:06:55 -0700 (PDT)
X-Received: by 2002:a05:6808:1446:b0:45e:f0af:5148 with SMTP id 5614622812f47-47c892315e3mr5222605b6e.30.1777910815307;
        Mon, 04 May 2026 09:06:55 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aa3a5sm31046424f8f.26.2026.05.04.09.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:06:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 04 May 2026 19:06:46 +0300
Subject: [PATCH v2] dt-bindings: phy: qcom,snps-eusb2: Document the Eliza
 Synopsys eUSB2 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-eliza-bindings-phy-eusb2-v2-1-fa3a1fd65ab1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABXE+GkC/42NWQqDMBRFtyL5biTGYIev7qP4keGpr6ixeSq14
 t4b7QbKhQsH7rAygoBA7JasLMCMhL6PIE8Js43ua+DoIjMpZCFyeebQ4kdzg73DviY+NAuHiYz
 kxirnpMiUUpbF+hCgwvcx/Sh/TJN5gh33vT3RII0+LMf3nO25P27mjEdVF33VrtAiz++eKH1Nu
 rW+69JorNy27QslYr0g2QAAAA==
X-Change-ID: 20260327-eliza-bindings-phy-eusb2-bc4dd201444c
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Huk0DuHaY6HlT4dVeeaD0BtO+3KsuY9qan8oFOyxcQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp+MQbqI+UNbLCUoFBJnbCncJGfkVG2nCDp2E8Y
 tFhpnq9fkeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafjEGwAKCRAbX0TJAJUV
 VqekEACM2zQjPdCQz4ITm/KkwKDIZU85HIQhe9fw4wbgDb9un7eQP8pg/Nf9VdEnsCdGkNjLZ01
 unTeaDwkT1MXeHVT5tuPLbMZjksXQ61huIq34rfRwbUYDaU9G/hiDQgkGvhqP8ZcYeVHSaq+Psa
 HqLa3GJNJfaFYPiA3kmTuqXkdUQi1kuSKwRyFOi1GJpH4/XyCl8Dc6mubnBPKxKsFJSUcVG4jvp
 zYBMRV99zb6Vxyfp7pEgS55aExtR7SD4HFJ9i/13mkRkMaH0rfCQUHi9rFk52W1Fp4v6oHI/lL3
 vR7OHW0bBnM3YiTojFP4kekvZsERXetN1houenpGKLaewFi0vM9jdVioLDOd1MkW22XcCGFr4Gb
 lry6n95i5322uH+vKqR7GwWfpSTnFl9A+zk61Z3uq2COBPvtl/ZfqgNvS8bz4i0R0ePUKhommnj
 /Ug88NgLW1oZwdJ5pEN/LPfo6nZgiNhu7HQUTT4gg+gpggqFK6qKidfvcltLzVqOm50xfF8WrNo
 hqeORDZNyv69To6Kkcj3xjjAkMEP7fN3/53yGzBqk8dJ1OFY9UqgEPz/CUA4+69hu6WiQtc/hOl
 JetDouwxLXVTlU6U0CPFOkmfUIxQ+XwBdkIyL2J/LRPQz6PyGbcG1somVDlWi9yeC/J+zR7nXB8
 n7Ljv1U7IxVSUAQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX6PwSeB2CfMjs
 rJh09BGql0iIfGULZNvJ73qBcvJ+A07wbA7XngDByMdCYzoJg7Egbv5grzuhxXBicO/ZrJhpvgR
 kb+BzN6ZaPhmiwaBKWBFBdRw0gpWB/3CXMuh43XoLS+emGR2FpcetPGZq7xBXST/OwoQQ/sRcEB
 m2G+pk6A+Poj75mfO/HSgnSqX85388f1+2F/yjHtiJZ9m9XYUsxwP6E46Ofn1NDc5F/PZHd7Qea
 kFCTTtYhmVfRCHhq45TG6GxjssUOL7d30Lwhq59q+IcXtvzBoOi36+zRUkdwDa3e80XdnIIcPp6
 XHQObGvrUILW6xfIpkLII+cDD08UtjpRyXWnEw9SvJWCEYEaSaf1FUnzdmwBscTOPUeam24d7Zm
 2Rmq0NGhxQr/eUl3j7XrEgZLm3HliShyEFAnSNHjOqu2LQMPY4dnGw8p1IBHxIQdyINaFI38beA
 zSf3DvH1F+iJxpIkXog==
X-Proofpoint-ORIG-GUID: i14BborK_44gOSoOqg0WnbMg_ebn0XFm
X-Proofpoint-GUID: i14BborK_44gOSoOqg0WnbMg_ebn0XFm
X-Authority-Analysis: v=2.4 cv=LdIMLDfi c=1 sm=1 tr=0 ts=69f8c420 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=gb61f_RGkQieOckiKckA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040151

The Synopsys eUSB2 PHY found on the Eliza SoC is fully compatible with the
one found the SM8550.

So document it by adding the compatible to the list that has the SM8550
one as fallback.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260430.
- Picked up Konrad's R-b tag.
- Picked up Rob's A-b tag.
- Link to v1: https://patch.msgid.link/20260327-eliza-bindings-phy-eusb2-v1-1-1f8a9ad6a033@oss.qualcomm.com
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 854f70af0a6c..096f6b546632 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,eliza-snps-eusb2-phy
               - qcom,milos-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy

---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260327-eliza-bindings-phy-eusb2-bc4dd201444c

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

