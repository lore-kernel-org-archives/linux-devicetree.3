Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21452436BFC
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511849; cv=none; b=nr8WKu+RYJHhOHayH5TKsD7W3mptENQkS+w0Zz6y2UuwnHS7KiC/3zbCyXjT+ChXFIy8ACqR+2pSE273dK9BlAH1aU89f/J1m39rGAiVuztdZrE4b+IH6JmeubSY6yOfZ4ZIscuSVf3Xl3nWs699J5qNRPw/fELXbYi1bxfPX9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511849; c=relaxed/simple;
	bh=FUXzDx/MqiII8ZYGHiC1f7+FAeVodk7UbwWT+31SNcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NC/RpxiyGVHybYS8ZjirTZAX6sJzpGz+u2OHIdENS0hojIlzV6mZShhzdY0M7xPEqcsiZKZlX1d9neKeTodUpBItvRlr1MW+Bjsclk9UjNVjS1sgmpDu7euueiuxdJhUodpyQ2vm6Uoqrpt31dMujy4oPRbkGrX2T51ODXI1dxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrhMBcZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3OQPlqI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrhMBcZW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3OQPlqI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BT6Iv2531002
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 11:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hHdBgQ4YRaAM8+nMh8X4NW
	ZFsOQZElrCph3RwF75yXo=; b=XrhMBcZWhz8SnPajJmP+ziafF3kUG/fBpaGnuz
	aSuvEQG9pS8Xu6R90h4OXf9y0JN6I/8HPSxHvTOuwuLk9vZMU/YaWx5HIq2GOm4m
	Ayzi3qKDei0Nnicu2TIi2YbbU6GuXCKrtwZed69m8qS8K8Rgu/7gkc2OOtFfAtL6
	egWEfY3z8X4T1LRKNG6noMxgIGClYDK1ua10fH1GtKKsb/Z+EBvOuaoGgE3vncnp
	IJRL0WEf+2bWPz1OBSou74sfL/QNHHmESe4gK+tpIbevn5JgNrZfrRa1YsBysL2q
	uZfdmUqY7TxQWNqAI8vAUERsh6Z5bleE15sFM5YoevvPxTZw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5ag5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:57:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92da6f3cc81so71834185a.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783511845; x=1784116645; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hHdBgQ4YRaAM8+nMh8X4NWZFsOQZElrCph3RwF75yXo=;
        b=a3OQPlqIAdQHh7utFPZOndNzI/mzD4cmCHHkaFZrjAeTUG+sjQL8eysVIsI89WUtqu
         OQD2tt1LUBBxEvoTG4xJmDwwIiFja0EPaEkJlnoDdFQOmG/gdqypyWOekZHJfmwL/FUL
         xKGtFe6Q7MKpP9wWruR7rT7/IfheWlfvOdQtrzBJlQ/CmV0P2i9yjjQ5qNDFsd2Z3Kyo
         r9N5kIFxx5okxv0IzSCmD/p8lDS2973h11PnfxAq+BUBRPuVrAZMn+dXU3oLn4lEznAw
         cj0mdpQWx9t9CY1EosLVHehqDxPx254JfPlXImpYfVyXZXimnhbZxrv1WwVY0qgy8+B6
         f2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783511845; x=1784116645;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hHdBgQ4YRaAM8+nMh8X4NWZFsOQZElrCph3RwF75yXo=;
        b=oZ39sI169hUGDGCXwyXtoLFhCArPNFGeVHi3Y/L+QRuvtuyRuNBuL1otRWYfO6cEbN
         1G64JTBIKpAeB2ZVHMEy3thBv0H1RdShzlXXZGlNDtlgSbmVMJgPBVww8DgzhT/8LL7l
         FBdrFArKQ65S4FPWnmiwVp3kybEt+QKVSL2dvr2oiAFQR8TpVJshxlx+JG9uJQ3yfLID
         EUJG+bcrztew2WDhhTf5iKJcPtL+w+9UrOfvNwXS+qAv9NwaaI482ExRJvphKTqrYUua
         1eaV5PWZuhxpM16DMo0YCjoJWoBnlGS7e0SasVZFlk7HXMeBZsyYSb2J28G+zskrluHz
         B4og==
X-Forwarded-Encrypted: i=1; AHgh+RrMRweJsC9doenqIm9irebClbRGR5JutB6ohcwoI28Ll0pik5io1S9uqCuBkZ6eFuKXLPrgv5MABliV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+N+JVvzBYfwiezpwQIWLxCE0Pdtvc0uE7skebG2VEofpyHFdi
	rNQ2zf4esbfJ95I3jRK45WNrk675vTSCVBzm6UWe6cQw6krI8GzIrhTAX1jzPo78pLZocLS93Ez
	OCvGlUvYvnlFT2DmmSFMJnbc2Z5cd0eBVlkCEBBzWW1m4CCLE5J92ip6qdenb4qwV
X-Gm-Gg: AfdE7cmfnoEeo1fzMNdjBdjkEjjjEMBsBISKZTFCe0oEUHqw/tGJTRRGwh3maEvo2l0
	/kgRm+35Rdh/TVz7F5JA91z4rwSrpvEbJI9GxYXqvNiif7HSxIKEEGt5WQgIByyOCfEV8j3moHF
	X3GVbCGL9PflzFZaOXL+wG3T9nU2Hgrre97/BkDDTb2On5xBPFiI73CC1lADbS6v4nMlemf3hFM
	tHwl8b4OZLHaaWSUz210W/aZQZIQMgloOL7NFGsT0x39xAzPUDmkVamsn5lGY4U9Gcu7azR4P8l
	oUnHBfzxpQxKEf9n5vl5ln9PJf0E8f0euzz6Bd3Y2fsl+uNQkb1xaAxz9jDhWnbs723yQO9CS55
	F/6xxEg8e+V0zNMY=
X-Received: by 2002:a05:622a:11cc:b0:51a:8c9b:6499 with SMTP id d75a77b69052e-51c8b40bf87mr21608751cf.61.1783511845176;
        Wed, 08 Jul 2026 04:57:25 -0700 (PDT)
X-Received: by 2002:a05:622a:11cc:b0:51a:8c9b:6499 with SMTP id d75a77b69052e-51c8b40bf87mr21608481cf.61.1783511844639;
        Wed, 08 Jul 2026 04:57:24 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3318dsm121284385e9.3.2026.07.08.04.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:57:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 14:57:20 +0300
Subject: [PATCH] dt-bindings: interconnect: qcom-bwmon: Document Eliza
 BWMONs compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-bindings-llcc-bwmon-eliza-v1-1-3c7dbcbae87a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB87TmoC/yXMyw6CMBBG4Vchs3aSgkHBVzEuaPuLY+pgOt4i4
 d2tuvwW58xkyAKjXTVTxkNMJi2oVxWF06AjWGIxNa7ZuK3r2ItG0dE4pRDYPy+TMpK8B/a9W8e
 +a1G3oNJfM47y+r33h7/t7s8It++QluUD/VxJmn0AAAA=
X-Change-ID: 20260708-bindings-llcc-bwmon-eliza-b903d985e15e
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1413;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=FUXzDx/MqiII8ZYGHiC1f7+FAeVodk7UbwWT+31SNcs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqTjshh+J00qB2eNZSzeutTwk0f8X20DuUsz8nw
 a7GNWPC+ueJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCak47IQAKCRAbX0TJAJUV
 VqPQEACx4mNaOxvWdzfrJJPyaGPCcaxAx3IHGbzJohk67QYHzC23Lx/f+NohNkq92L6kS+wTPXX
 VavhP/VEENW89+yNxyT1doNpj7i4cd7JGe94R8WwsW2UA/tYv0ZRa4PNCQ4QatOAAIKZjeXYu5i
 xFZRL41gGzhf5IlDhGKAK+QNW0/rlI8UDyaZbxKZKbSX/Q4mlAo/wVBgi8FXYknWCWjY1IPx8HV
 a6xOaluJ8FAvlQX3NfXrU1B0LeVs2iY0/bhu12RYitO8dO8zmXkgJJvyFotCPK+rQhuMjDmitcD
 jTkpmeEHo/4zjjVWzWIEzfPT+DNq0MyKvPH1cNR5wZCxkaNaSElkvP5EegxGMziqEddY2c4/hb0
 PF3nbkXozEM9H77KrTIsYgfbfqGBjxtbpS/+6IDEdNyKqnomAvSg4BmJ9gUHRpLq+Z/keO5FD8y
 4lVDU/yLYGvEMYmPmkzLjzClX6WQRsqhcMWJmvXMRdcbn0vSKVXCBGtrl4Fayj+pOFX/RsdjM3l
 kzpB5sM9aILfEx59p/GdNvpNjfIidSlIf+Trx112qQ0ZDPRYxYTAL6I0tH4C9ipG52DhigacJxc
 PYeN6tXgjqQ7MuQ4snfrxaR++nFhVlu2oP9IkMQ+lk+AkIkbbrD3StsgmXJMW2sMDRE3WOBcfXy
 RPtHIIFHKY2dl3g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e3b26 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_bAYtE0Crml8VzQeUhIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNiBTYWx0ZWRfX2oILwy2M1bdk
 K26+yW78E0UaaDOeETINFlEYEKAtscJci6Zyg5+RdmbiML05K6W7Ick2CeSQ4/OFagPXPB826BG
 rAGDGMO8Cmby1LfYz4xtiH0QbMp2GY8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNiBTYWx0ZWRfXxRSnJNMiSceX
 7inYjgJjARD5vEwXiGSzhjOAVISpu7o5ZLM2Z8zlNpSw8dD/la06aYC8vS3SKBvxkQ/4pCgQLCh
 2NlJDy7SPRfadZuy69ntKniF0l2e2obNGhbw8WmhW8rGmv3Fb87/8Q39QWCWh9X/I5rprRtBqCp
 ImSdRhtAr9eXbpDaRXDW3lLnc9w8bGtP++7cIcrYTIKh17jACXXTcaBnWink67omioD9zM7/Jmg
 w5fsI9oGVWPcZuWYcDHoaaOYoIbpE7JrRj8csyGhAzsmH7MKeDdfjV0qvWazh//rFrY+EWFeyif
 1j6oiZUOtXyUeT5BaNjOYRIvifl4BBvTop7xjqg9d0aEtQVDMQraLhEsNxidrhaPWhgvcfsDwjh
 X0X9No5h/6/gxSG6QMAJ7fyg1VZBqVV8ScMNxNL0glnnr3j5SGu2hy6oAmuXn9RVs6lHp/LM4uB
 xSeB/EE4vryVdEqhXKQ==
X-Proofpoint-ORIG-GUID: 41i_HESel5TOE6JvFKzywDZ13WRJ1w3n
X-Proofpoint-GUID: 41i_HESel5TOE6JvFKzywDZ13WRJ1w3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080116

Document Eliza BWMONs which has a BWMONv4 for CPU-LLCC and a BWMONv5 for
DDR-LLCC paths, same as SM8550.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index e002e70580f9..66dfe70a8c34 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -25,6 +25,7 @@ properties:
       - const: qcom,msm8998-bwmon       # BWMON v4
       - items:
           - enum:
+              - qcom,eliza-cpu-bwmon
               - qcom,glymur-cpu-bwmon
               - qcom,hawi-cpu-bwmon
               - qcom,kaanapali-cpu-bwmon
@@ -46,6 +47,7 @@ properties:
           - const: qcom,sdm845-bwmon    # BWMON v4, unified register space
       - items:
           - enum:
+              - qcom,eliza-llcc-bwmon
               - qcom,hawi-llcc-bwmon
               - qcom,qcs615-llcc-bwmon
               - qcom,qcs8300-llcc-bwmon

---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260708-bindings-llcc-bwmon-eliza-b903d985e15e

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

