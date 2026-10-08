Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A583D3318
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 07:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443680; cv=none; b=t3v8AmHFwOz+a18AhswHd0mICG8mMWPBnKv/rpbFJfY7xEyYgQAaWgpueFIw8hDu+NOK2HH34q3yMpc8Msf37V+OyDgcIlcE3jSnRgmpbHYGTBeTNUEQ41zXNzYG2+SvS/H7Z5BNAHUG+zpmP8mJBAVvWssxZ/GLQG+NFhnP/+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443680; c=relaxed/simple;
	bh=zsqdQtklwpvdbiVBw+YVSyi6bmJpPl6N7PlUwRG4pvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZdkj61DfsbCpIk6XQ98WGw/ol2T7z+WpniYW0j43eJnSRdZwLLtT7EQNwo8kru7wZ3BpyVbIgqOcqFBeI3yGu+PO7WoTtGi6kcPApMOg6hstuXOebqqQQncdIdHPoBeQblRmfbl+GSle4MHJ6dFl3kIQ8i9CcZAGjA0NtSDw2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4LqJ73i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqt4iNH4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T4LqJ73i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqt4iNH4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUxu2895413
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 07:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=T4LqJ73iX424NhwF
	OvaG60i2cpo7delpM/GwgtmTXxSsHL26iXAzduGSNUG7lSAVK3CZXwzQq4iH10sb
	n7PcComUKC3pOp3p59Rg2stI95rSPfJYutBHoOs0uHsPT7P6bz4ZTEQuS+7w/r79
	TGn/LVVqo2O2bdrPyQMsyZaspLiubCFAlSGw4UviVwgaakea0xGF4GiYAlwIfwYA
	sBhxDNj+P0SMtuqiluBjypx+Jcs5c8ohZcUqgr4KVWjAJOwamLCA5vCWoM3ZF/1H
	SAbS0ad8Yx4srzM42b8n0cm2xx4TrxCWkhU2T4l1Fh16xX6bN8XRDY+X/S+L7kGt
	mQ3G4A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg97eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 07:14:38 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so17363995c88.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 00:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791443677; x=1792048477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=eqt4iNH4enKX8kGDVLOtg73OoNLplGBBmj26Xh8hJhokdVuakdhVJQSDYJKUHXwoVd
         UJmYQLxBFZmcMySdVpre32HkfqeSCGF/s2ujbVsTJ4ra7Ky/3nD5/rWdK0T65rPRn3BN
         xOsu6JnMJI+7/+6onpgSo7y3C8w1YxmOLWIqpjogZoIQ3PGODOFEzn+zhkc2XwwHGkTR
         64PnXR0aAxE9jWqOBDmEDWI6J2LxOdvzB/acPjOfqhx7glRuz+TY5hRMG6D62sGLUzmC
         9rbX3atg8JnRgaLbUKj1yPjPe+DtaP4DA8ZBj3CEkhS99MqD/WZzbzKGdVzPrgy3HogI
         wXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443677; x=1792048477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=vifaOl7zcQjLZ6O7B0jMDTUQExhyNTR/HUbl5IWjiPU322p647PBIxGyYt9s3Im6kA
         zPx0SNIpSJgi18q2y1vyakP6pLIFyrOp77zK7NbQotTg91ZmWwEQ/TGXpLSZYi4rIU+q
         brBFQj/KqKHOSRJbRPLovQ0vTJn6YU4+pIewU6ad12HYU28XLu/azojqDfTUQumSiCEx
         iT1+vmkM6j3/C1LbTJ5WhLZb7gyWN9/mjBWCgiiP23hNzYNoduAfWHTqExOSDJKzVxUe
         j6QBglsPHr1a91cHXB3JGkhYQRPQ5ml3NKOCy+6VWkh5DifxAbvcn9dYlaX0em9bdoFb
         iCGQ==
X-Forwarded-Encrypted: i=1; AKwUvByQOFhBVdR61X8qJrr1OvPKSYqwFmqvO3GhK3vpW7kp08Ko/B6Aiu6rOC+aLrpxcss8SDAGCYFaX76w@vger.kernel.org
X-Gm-Message-State: AFuF++n/SoGPZkMeMwgamSjKdnYNkjeoRTSt4Cuf8XBPYcezdMyhRoBs
	lejCnUs3xn7c1md+KHUE0szkFd3wnZySdc+Nit/MPAIWemx+xpNVIeYPwK/gSHb4bu6q2add6mi
	tWU0te76A4F4T/KsKlYMeQke0tGZs2GTIkdoUmGSWDABXM4Z+zSG+ZwWGLLuY/e9OUtsUuo1/3M
	0=
X-Gm-Gg: AYBFou2dkmsWH76wCGzVi3COo7341ce4P8Ynr5Bn3BbzyGvX2Reo5oTxEzimhxoj/O7
	icPmTRq6jVsseto6jXIN3FhHY+yCshpr8bCCK2tjQJNJFpgYkst/UWqtmzbd2rfpWxoct2M6ka5
	pVmDYE4f5W6631CL9KgJwjjFGslpUTGNX6R8LFlfdFS7hQh0BCYUUMvp+2KDfyYt2Xg61l6Xt4o
	BvWt9ax8LucK6FdenPNkcBBlJJS9u4E/QXJR8rDxEmsVMK7Fwmw9htkkmR1rj1HRMgNxk5zPvFY
	nRTs4ED9dxUmXe97O65EhDj3cIu5lTlptfrGES5F+ZGiv/DQiybbQoMGVZ7SUFTH05ZHF+QaRvA
	dQgq83wIkzaw2liM7TaJKDQXApMSF5CfgBdIu8/h44dsXm6EVJ/HUwxGHeQzC6F2fRNwfqsk/MW
	4RE7pOh/JeKw==
X-Received: by 2002:a05:693c:8819:10b0:352:2e15:49a9 with SMTP id 5a478bee46e88-3522e154b4amr397460eec.33.1791443677277;
        Thu, 08 Oct 2026 00:14:37 -0700 (PDT)
X-Received: by 2002:a05:693c:8819:10b0:352:2e15:49a9 with SMTP id 5a478bee46e88-3522e154b4amr397418eec.33.1791443676710;
        Thu, 08 Oct 2026 00:14:36 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af155b5sm12251625eec.12.2026.10.08.00.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:14:36 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 00:14:31 -0700
Subject: [PATCH v19 01/12] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-kaanapali-camss-v19-1-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
In-Reply-To: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: ADiqlfr1ae8maLZ6Uoy28DKsF1s3ymwe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX/FOfnEv3kvM1
 5E1TwnYwde9JTsw2SMqzE0kTk5WE1ztabPDwhYGO2gEYfRxleGEGeB+SDTmZjtQ62DkN04dm5gQ
 mxjqKbSxejJMqcupQL4X0BoPEbl1D0o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfXxF7GKbwWDaXB
 dbuEidvQWGvZpqzNDJpNcIk9bZxOgsjhMn0m7mnS1E1Q/FswvAxgIZPGCRaD/0sHujC4EcU6dRC
 iU9Y0k7gLakJhX1IK7nJcs/dQZKLpjbLHdautkSkvUsNZrBFjhTJvrDH1PJP2hebH8h6mxQ+wqO
 yFkgeniwDp086rLIdhvsI7RCgBXdTCZAPHxUzs1sHm5oRId0aznwtvQ88B7UyZQedDdnNH2Bw44
 rVETsXoLJUbIcmqIn2DF4OU6Z6wXLd7amsoIryuBhKXvIUAAHXi1UL+p0dG8E0QGn4dizUhL+OJ
 iVGsfAHkqvNkjZdHTAbxxWYTZ1nF7Pkvc6JQxBM6rIp8r2PpX8DJaReExzl6yJ4ZePDq2N1vFSC
 LYMX3jti04gCIVWZgzTnJn9fEdUNpOqT3Fp9QeahHZyNJuPjDWROaKlWeFYMtHQGYe/Kw30YozR
 5eqYwrzD3r9gSQAEbHw==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac742de cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ADiqlfr1ae8maLZ6Uoy28DKsF1s3ymwe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080028

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

