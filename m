Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0283749FD
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785910; cv=none; b=uJmo67MD3/RnNsycERaO/FNZG3xZuwyvEaGtwkiMj5Z8QKsjXLrx3JeuVEYnRcGiaIYVnm9ezPBWdR3iw/sHLjew8Y/hzjXnsHgbCk1L70+64VXmUmY2dryqloi4HYj5aC/dSW3OUhL8Nx3KHadirEyG++X8lWTbSAHEixqtwmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785910; c=relaxed/simple;
	bh=WXqvJM+D8J9+hqIXx80EQDblZxafQ7vdENgEXKGGLZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpvP/FcYzQR4uNpChdVZjCSp83qGm/q24GxRdhdoBZhyARwVaJnHPPBfARqE2ytNOG7OjvsiQaQjgD87g+yl8LQvyM7p62mqkskYgr6ZotqmQ5IsX3Z6IGkxZJAbWgJQFr0t4nByDAqSWwPDGud1ptP7FZ2t+kH9PGN9nSkGWJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqTmWAiR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDMdRJC6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqTmWAiR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDMdRJC6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55vck4068714
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	48nDiI03hrqB8u7ZOj3j4kE+m9ZExo0E95r8MhUaGIY=; b=UqTmWAiRWJoeQsRJ
	tmHcgl4q20mPydX+sXIT8RxNsCeyS4YqtKIMyVcBxMo1JorYLfreyHykSnSC5vE+
	KkHPsazU0seymLzC5KivBI3hlTe7KynpOxmoV2sgdedGh8sAnIvMBB5tnoZ9h3y5
	IO9jAnQpsFNObzTWE1Ou/kyQ+RcGBl04ZWh1lShBI7/7Gg8cE7ciaisw9hrjTdFu
	Ms3/9uH9/rGlHBchWvqln9qXnmTQ01TfA2BKzAhro2yBkCkrhbFF0WPCMxi2ropM
	KKM6NQa/jADcLKq9BFhNxRnip4C/vL7ocm2BQVAQJkKfZ+uXi5VQ4sk6cwCIj1yW
	oqP4Tg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjmway-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:18:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so219771a91.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791785908; x=1792390708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48nDiI03hrqB8u7ZOj3j4kE+m9ZExo0E95r8MhUaGIY=;
        b=kDMdRJC6mqBGUP/FmY66eB24uMq/E+zyddHnRu2Z7WenZQeIcl9XtEntpWufjXznBp
         /qi31pqg0AbYPHEdsIU6UrWRVggNp7kFjaCmaJ+IUGcgMg8D4ng/UxY3zx5p0UFTTVhn
         bGh48b4Isonxw22pD6TyXAzuPhRsVrorPF8Lh7DKIhtssZNxrYuHpl8Jq55YTRm89SK1
         +Ci6ng9czkyJAFFD5dRpbLtLsDjyoB6j7xIUtrJ2UBDeWAA9kWWSqJPEuUqnsnLMtR6W
         JNPtTPM5L8ctflbxlLs49mDcCHCV6WNQZAG6+El/LFcdMqR83cG2BaRK9kSl7zxFbqqc
         NE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785908; x=1792390708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48nDiI03hrqB8u7ZOj3j4kE+m9ZExo0E95r8MhUaGIY=;
        b=PbDSCq58xatSixoy/brqo15D1Dg8rlo/4JUr4iIbbhUYeC26Rm7XFzY7S/Sj/2uYl7
         4sdOtb0dFxX4aVmhBkmcoJVdkdycEXv36MXOoCAm9969cyd9SOPUeJRjsefnejr3wmhL
         iWc/AHtqGR7UbxbSD+KbyLF6iDoavxXVWzpXgT5JAIXDnW8iZ/1Qbxutw3gTxxG4s4Tf
         WjTD5EWrAsRXhLyUKZPEgL9CKuTxgM3Fd4rlHKtAENIob10M5vg2z/XC+WuqpU50QLFq
         UvOBPrhPwFgGGjGB73P0wv4mWTrNKcwv4KoC1M90Ekt30kuq2gfRSHvR8mqMySB3OBp6
         Y5/w==
X-Forwarded-Encrypted: i=1; AKwUvByG6BgPecIv9SPBJARv9ODQIVaiNOkyQ2X1uMrzy1vbVfUbrBFTUV/cwYrF7ZimORL0AfK0GYXN6pc5@vger.kernel.org
X-Gm-Message-State: AFq9FYLAd8OXwZEhYEBb6W/RlAKQGOKJO73BVKAWXwzFpKa2FRRcNspA
	twb0koTTycsAMEpZjO5nxNtBWrQLuTrwGhIr5K5iFILgi4oEvKm7rS7EQf3Y7mefhD1EhPbLWfr
	CcBq0JwDm5blXOLq9kLhjF7zgSpXGGfmzjuX9Wekv5J4oQDdwAuMtBSkf+9l+W9cj
X-Gm-Gg: AYBFou05Ij7d8spCF1KznWlUzypxQOGQ+Wsp4vldxZWCcy3PPvEbzqZNkaRdgSyHQi/
	e+8Phs0ZGe5Ur/Iab9W6a+CWCSbQ5JsFxiDSFyJkS4CRvCsRCglTfFXBl6uKGP7n7EF13LvLlZ3
	/rx9KLT5RfiX3XWCDFmQZUz4vwNT6jrKMjHX4ex9BGeobrL/I+m2suBczjZrifP6YK9igxKchfM
	zlfQkaANEkE6xKSSObyYCg542lnaTzrJrBobilGBLNhrHPh4PJ6Jp8g7Pm5+Jjtf28Sj8qVJGtp
	NrWU2Ifjs8r6Giugn5Hig0naj9/Pnnp3N4mEjitN3K+33TM6N3Lz0AshVe70V/cXLMUTjXDz6Fj
	sddpnaGOcbFkPyLgGSwDF
X-Received: by 2002:a17:90b:3b84:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ab3a364f8bmr6096577a91.4.1791785907714;
        Sun, 11 Oct 2026 23:18:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3b84:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ab3a364f8bmr6096571a91.4.1791785907278;
        Sun, 11 Oct 2026 23:18:27 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm3770481a12.5.2026.10.11.23.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:18:26 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 11:46:26 +0530
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Talos Lyra EVK board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-talos-lyra-evk-v2-v2-1-dcc9316ebb59@oss.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfXwqXDDRfZf2SQ
 mXnSduS4Daic3CKk5vSqy3EJGc8+1LIU/KKfBPL9J15q65ttit4l5M3+HMXwsM8grH4dmqhdaKV
 iWKEE5a0koHGHdYeESvEYQl1RI9BN1l1lLVxW1xJ0uk+RWH8NhOvWOQ4sUiKQpFK9QHuk83L5gE
 FmKFYhIudxVmNi8RpAJUO1yqUrUYTgaO1iCxbv9iXUrDfoUwQBuctd7qMV3pwTEOS6y1Lr5Mkb2
 ixFEj9pd1hH8JpTSSboyw/+FceiXlk7mn77VNKHBq7QBDYga8yZbuaFLbMI/9NEzbQf1fbpKhsa
 sPgj4cO51qHUugSsS+E7e8Frp/Mdc9Eg3666Am5iCJp/ZJWHWKLMB9oR4ojkRrwL3eaWrMpjpna
 FoGBmWl2lko5K6nOZnNNL1pIHjYM1yX7Grpy1jMPWVXMcydCURI16O6T6+dDJEPHjCr3oxeIkAZ
 ig8XQc0Z/8tVdoIoreA==
X-Proofpoint-ORIG-GUID: pMK2C2IxJcmcqjqC3YYgmMMsPqzCiBFG
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acc7bb4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9mM5XA2LrqDQA0higt0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: pMK2C2IxJcmcqjqC3YYgmMMsPqzCiBFG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfXyGausZZBGpmt
 LRHJWysOvhVkUXourZVKQv09QAV3lkZqzTI9oM8sfSA7t+92W1cWAeGfNfjOaiv6I7DbVofauts
 qgHYTEm4dawLHLlRsM0QUTlUxX8HOZc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120024

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
board, which pairs the Talos Lyra EVK SoM with a common carrier board.

Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..d0e30d6c1d4c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1089,6 +1089,7 @@ properties:
           - enum:
               - qcom,qcs615-ride
               - qcom,talos-evk
+              - qcom,talos-lyra-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 

-- 
2.43.0

