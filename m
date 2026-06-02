Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D77395AC7
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 06:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383095; cv=none; b=KTGBfQkaHg5Dyoji6DV7JBncJoQcuxGXvTKffQWw6mKGvGHS+5nbZ7Cvtw0Miq3KH6nUCsrep2qVgSELUQWU0+mBa/vsBI1HCX0LPKU+AS0KUZjr0rGhYRMufQI2GdS40lS2aInnid2ChCQZQuuuD0BlHDdGFvqOBBdRVnlNFzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383095; c=relaxed/simple;
	bh=dAJCJcvTZrg15xJ5E/ljL/FmMqY3NfRmZnPBFAjtMBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=chOGOztaSFos24NA3DeyVXUOxFQTsj2VPPRoLafuM0TBmknIUK5CcXng9N2si4TtkrFf92Nb6jtJN0KAWwPkttpYyvisBUBYHp2VhavqlVz8fIS0YsoCaEHJ0cdDXVxtbXJQhRMcOCSiz7EipdL8ph4qKWaL3iJA4+21Gk6Zajg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uz1ELxjZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fng40ApV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uz1ELxjZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fng40ApV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525io2H1316228
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 06:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GsTAm6yVAc9OEQ2D1Uqg1M
	9QdUAqEiPVaCqDuP9TshA=; b=Uz1ELxjZqczXD17wRd0wF56noCBTlv415ORYjG
	z2TZ9AxdfTddn91doK/LvPM6MrYhYhU+xEpqz3kXsYjqyVkW/9Y1HL4ZYOf08/Fg
	9yNPU3AHBxYC05yehFB9AecU9pN4s+hlFvGrGGmYBAHFjem+2PdpCTX12yOaNT+2
	BK+qT77mvPHPJrTNMRn5TgsYtrS6l3FCPeoVSF3LcyDOjR+rVdXwqRxYP4Tr+pKX
	an6Vf//qREggOn96B86ROKOdjgMhuOHlybExcv4QPS95rJRpxx2rInq7g6AS0NPH
	y2/rlT4ZrZYIM0tIYzEAQNegiKBMlJBNzVpUSKsgNnCSVnFw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vr8ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 06:51:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso1956633a91.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 23:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780383093; x=1780987893; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GsTAm6yVAc9OEQ2D1Uqg1M9QdUAqEiPVaCqDuP9TshA=;
        b=fng40ApV1xo50z/FHN0vcK7Anup9ejLQYLcJRSRWnCGIZ9OEn1RK3uS/O7dvcMOQLP
         sy+sQg5gTohwBOIxf0H7zl3ZSObADYhkeV8J560ORVLyEu/XrQ4sQrlvfEHRocnF+6qc
         YW03MG4KKlznvp97wbx0wHkM0gEaCTUd97YX7CZn7PIt7/YRaVOTBB4KwuDnE8RoIAp1
         DpDNO1g++PpYxcaVEzDjcc6bNIc50P3hey4cmYcaH7ZTeYnxYoNcg0aDrLRlQnkMj2X7
         mM0jC64LcNU5WY288Oj9vDQsd2F97SRVA8mK8U1ZN+YmCTmPrUuw+zwqou9d5ZJ+eIw/
         0ziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780383093; x=1780987893;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsTAm6yVAc9OEQ2D1Uqg1M9QdUAqEiPVaCqDuP9TshA=;
        b=b/pLu4g2gYSBelT40VIQs5GZN1NdkV/TUB1WUVIL7XRbG6uKQjDTJQmpyka1xdNaZE
         yZK0wsQNOLbpBRSa7DPsPN85ErHhspQXKspF3ZuC1P6lWnro2Gnsf2MZr1G+IbdpcD/e
         JpwM7dSIhsjn6NlOZyi3h63IC8tkM5n8F7edwDCTnCsr72juN5E8YpuRpRU+6dYp/BHn
         hEjGukDHIQ9EXhPBXA4rQh3U/Os8NXmHhauTyexRsndUdqjj5Rn+s0qjF2WQwee5ba6k
         cO83fCxC4ugjjSm9nZ9U18p5vLf7BZXSZR42ruI1uJcF5iwm5SV+l1bx+BqRvErkUgqZ
         QGWw==
X-Forwarded-Encrypted: i=1; AFNElJ90rMbxDbR8BhAeXuEZEKKXbwKn05SoEzG1GyCEIlRhRGAIbvBZSOl5reQxXNHfbhwpd+swteeLYpto@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1w2NqxDQf7/3sCyqi8cxwUSmrQDfKOyrgXDPI00AjvwdaCnQe
	RgJT5RCjx8/a+4ipSIL3ofsrkg4kkgRFyICzIPbHWHD6lQhW1d3UDK0rpTBOQ+qbL863QTumprF
	+POL96s/cykO3AKBQvoq5Fwjomi8KKsLgv5D7LzK4nU1DMGpWfx+N4Tlm4kj/k3doywTOEUSP29
	4=
X-Gm-Gg: Acq92OHkOAYrBf+L04LwhtsjY53qXmOYJ5g1PbgwHBlhWinPUxeJPuWs8YawAFbyWZ/
	4j/XRXfBzcnw4gS4r8OZHWN8TlTuSwdoddRP7jVLgXEcdZHYMqkbdL4FMCpBpZCTvraCQAcRrw7
	aGjDh8QVZ59783j1QyRwBFKIhDLo9bT08CHIAotCu9XoCN7R7GgVMfbXOr5vRCRc6wcvGgrkLOO
	BVDtizPbEdDhYcqpSnMMAXg9URUdIiVtdidCBqASfZUE6XqrsSdlqtMegjrTTLE59QD4wnJoMcE
	/d9ycnrfknMfIsd6peSJX6bl6mpO6/sRdekMkcKrEzcRBpl81uTMece35hVY7kkUrlcMtY895FD
	XXqKQoY22htGNpLDbaJmA8DhXZHTEv5F5Xb1Ql815cthjyrAJv0ewXoGk6CM6EOVaVCa9mz/gLH
	gTBQR7K/uMF7LhuzQOFF45YletBQ==
X-Received: by 2002:a17:90b:2747:b0:36b:9c70:3367 with SMTP id 98e67ed59e1d1-36c501e8716mr14130953a91.17.1780383093339;
        Mon, 01 Jun 2026 23:51:33 -0700 (PDT)
X-Received: by 2002:a17:90b:2747:b0:36b:9c70:3367 with SMTP id 98e67ed59e1d1-36c501e8716mr14130931a91.17.1780383092889;
        Mon, 01 Jun 2026 23:51:32 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd9751ea1sm1792408a91.12.2026.06.01.23.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 23:51:32 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 14:51:08 +0800
Subject: [PATCH v2] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-fastrpc-v2-1-67a55e22427b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAF19HmoC/z2OSw7CIBRFt9IwFgNYEBy5D9PBKzwsif0ItdE03
 bu0NU5ucpNzPzNJGAMmcilmEnEKKfRdNuJQENtAd0caXPZEMKGY5IJ6SGMcLDX+VCvDvUbhSKa
 HiD68t6ZblX0NCWkdobPNmm9zDOMPjPh85aVxp3fU9m0bxkshJVOsdMqa2qC32jGlwXtTOntiX
 JkSzuAdIllHmpDGPn629xPfyvajQv6PTpxyCmjAOa25keLap3R8vuCxTh6zkGpZli+WSQOZCgE
 AAA==
X-Change-ID: 20260512-fastrpc-9f3b691f8e2d
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780383089; l=1182;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=dAJCJcvTZrg15xJ5E/ljL/FmMqY3NfRmZnPBFAjtMBM=;
 b=37zMi3xFZmk2qu17+LzEp1W80jW0ehZlgMHZ9l0kVyNf73S5OC9px39BJCNjdktyTCGHwJYiD
 wR3nRCgKDRaCLyxEZ6sHuoe46JHJGoPLd178b457v1pCh5QuFzamqBU
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: griUgsZ0kuDQjNel2HLLt5mbCOczbwgB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2MiBTYWx0ZWRfX/es0aLvlzgtS
 LO0Ob/uZX4B1ruA/TCDtZUtACJ6qyQmggunM2AFGWgqo8JytHfMNx0ns9OcZ73jyyEJ7VARKVZk
 DnirklIG7xyLOxSp7V6wIozcfPKJ5ewnLJkivfjsgzCr+3G8UoIteXwTN9t1tDy5zSCpUUH72tD
 4Y/Zkd1TPyjyxCOHc4U0TS3scqYrApfOS67tb0PdIlJW2rxZH12P2zs7ENk43brMypP7TUMSgSa
 qFw3tzAH4hEISittl/USMlf7ExG6LOhp45yqzm7mFn4SI+Et+mIG4nZ8iM3VbW/M8ptPLvPMVY3
 1JsppirQKipsozbOyOnakYFuj1i7O+W+lNE6qByOk+6v2/zIlSfuBX4igNp/RaQkTDipIseKT5c
 FvXuWp6eHIcuKeiRGzKlwWnuvGxJ2dlnf/4YiSRw6PqjQLuhzu0eRbjG3JE/f99eUZPD7PBJwA/
 kB/MOWES+wOdP7oZ/Ow==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1e7d76 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=PmvgEI0Rx0sAJRWD59EA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: griUgsZ0kuDQjNel2HLLt5mbCOczbwgB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020062

Document compatible string for the FastRPC interface on the Qualcomm Maili
SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
fallback to Kaanapali.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Changes in v2:
- Drop Assisted-by tag; no functional change.
- Link to v1: https://patch.msgid.link/20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 2876fdd7c6e6..afe52296bf1d 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -26,6 +26,7 @@ properties:
           - enum:
               - qcom,glymur-fastrpc
               - qcom,hawi-fastrpc
+              - qcom,maili-fastrpc
           - const: qcom,kaanapali-fastrpc
 
   label:

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260512-fastrpc-9f3b691f8e2d

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>

