Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800950;
	b=EEOBImRAk4Yli8W95UgzxFsSUv5cH2nH2XbcoH9qhpzeiJd/swpvFcyFuNQrmx+JrjQ/
	 jQ9X59hxAKipppuhvpy0URRBAt6m76y0H6HhskeTqw/yN0ot10vjtI+ZR9nDQjedns/Qb
	 yZHOwCzH/U/DCcBXfT5PUb/niJgp+nmwk2av6vgkMZXQH81fXY/SM8xD16fjfPgn7FEOJ
	 pggJjvzp5m+vXQOLCmoPAGDLCb0bww6XsS/jWqX0JaORKMKw4m/Zuzf2M+aRSrAmq3mtC
	 Qxq6OKTJHxzF1SnucopPyuE49zsI7XHfyiv3bRqU2A86Bt8LsTs3LyKs0ZkYKBbMPjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SA3uMpD+UAvRA0hiOgIQ9xGcmVK/7kFG+LaGoeCIKtA=;
	b=4kRsWPH1SjFKF3zZ+J+5yI4ZHE8ezBnB4OsVu91HqGVhQJdmOqWf6Cp8vSysOzb5cRfG
	 zvX0ZSJKaM1w1nrsyRzQ7uicCiCM7ieXMNfDWTIfeOJtnxf9ZYPXkjM6wx6TzUXnUN4tx
	 CgoENNj1+krM1korD4eQa1/FbKpnskir/ReT2WU/gjMu/qRiYeUXoDyzVKtvoYs/M8gSL
	 K3byRlERpyIiuaj8MD1jkblNh4OY4+qA+Ltzorc5ZQ5i3QXP2ccV+96P/7CrmDhkPxc8p
	 drZ3grsS08WzXWIq+JDAV+BfaslxqtKJz+S2U2nDXl49RGCfbEZB2MdeqXXlFlGTVEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LD0zxWQi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="h/3WQkE+";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDF3606A32C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EDF3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LD0zxWQi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h/3WQkE+
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1M9QA1716011
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SA3uMpD+UAvRA0hiOgIQ9xGcmVK/7kFG+LaGoeCIKtA=; b=LD0zxWQiZDWz+8KV
	3vthWQQtq26MFoUNo5ZHvWFvnbQKXQoZ0KcLIHrxBYq+1xXITnktdPxL2wXhNuy1
	DjcoRdtV9gFBgQ+BHEHjR412dECz5Ot5Uh/vRhxTHPDa7YmR1WiFaEuTmdRslsZT
	cLMD4iLlqlLIFoxlPLSeTnd5YSfkYzwQfDAXBuLWsKpfAeedau6gj7NtTdK94CWd
	K6Sgke3HVCsDY/Y2R4hT4c39YxTTI2yIymNjzDTI7O3pGE4mS1dwdf1utxakUDXP
	IuReBiugvOPIzf24Sw9vmizU/zX7TMGhJ7kC4zOrBkPZH+0wPBk+o4ACbGS6SHx7
	ueqW4w==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8vgkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:49:09 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-862b952fb06so501699a34.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 19:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794800948; x=1795405748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SA3uMpD+UAvRA0hiOgIQ9xGcmVK/7kFG+LaGoeCIKtA=;
        b=h/3WQkE+oggUIiDTgFhcHOx0VhOegMCKhgwzmuI6QydRRoCxqLzjfRtIpGzGIsVB0R
         E2SVVjS6FU58IDd3NH9O3oSGOmbl2diyO8KFwUflRq4Zd6YmgiuR9S+A1mrxsKhEZm7D
         jL+5yS7bs9Bces54H9cSNpzRDIrLNvSX0oq3W3IkklsT33BUFLxJypkyFjr5xTW65rw2
         qo/3WqPxHQWWI/E0p/xWkuCjpR9aIYsZja4ZrxDnMfg4JKd9Ie7AXCMYLTn2t3GIXKeP
         RSbsFHSjxPp+lTe36QICHgMQRsFcQzT1LQUaa9/NSTMgK/tu1Ke5kcI+sHCFjvXGPPJL
         wj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794800948; x=1795405748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SA3uMpD+UAvRA0hiOgIQ9xGcmVK/7kFG+LaGoeCIKtA=;
        b=Fw/htNoOoX5QLDRFz8h6pubmXo6Pr4R/jfSHwQEJ5XdLenEtza+Kt5oo5PiyY7ZG/v
         UnZBVD15TxHaOcEK/NsQiSipmZK5b/1fDfzH/hQbVPMUkKJENcpjGvaadbfsnOJc8jbe
         SMmnNSN9NLZ/gHZfF45+dRavqFnnWnW4ZDDibMBrcEH+v7eCKllUXBK9c9uQhOd5Gv8Y
         v7VUi5+vHLAU1wkNg5boUWfleN0MiqYg0IgMlQAtzOEzDkh0WfGU98Gj+gF5ppRKCPGZ
         xk3I7CqZrEunlNoVMMwh7myWRJcfycuZU6wkFcLPU2GLwizs/XrKCkhlOONrp0uGrEFN
         k4aw==
X-Forwarded-Encrypted: i=1; AL+hErFZ+b75qbDU8DD92ZI8kpp3bEpDgzOMnlIM/3+8o8bPL2b3j4eAWiSIW6u2JMxiyq4NM/JfUiBCpMB5@vger.kernel.org
X-Gm-Message-State: APuU4Z94vsemd9k/YMzYWT0cyBm10mOzaOyov7iZSLBKR/AF3K38t9pn
	KbdjgtjSKZGuKcDOAn7QUMR0EG623xf3MQGj29VUJunPCQwj7ry5hK9m39GfuyFb59WilBHXGq7
	hbdvxJUDjG6Pz6kF9yqPfbHY0qahZPA9LqmiRhth5gIcJTh7RNQy4GJwNt8fraWfu
X-Gm-Gg: AYBFou09sOv0AWewfK+jmi6bANR7AKt4ZI0sR4z03ibsqDras6iY25Vauj+H0p5JQ6h
	Oa7/+BdZgwfJwnpG2ScTE3DTm3mY52wmESGRozJLfF8zdrNphcMNVZieFkbg1/FMznlpMMedpwC
	lmC7J93XJsPwGXU0kiyMegNphFMrVEJpM51TiGOJhGUMaQYdm0h8kMyenhtET/JJVKYRmrdxcm+
	fUaR3n8Cv3rPNFbRWPBjLodaJxJ7p4ajYDu6WCIcVZsR/3oZ6Rp/IFiE19Z0KoyorLFcJczIwNt
	nCF3aXSk4ssXSo/SIs4O41ZbBx/cqiauliQxzKV5QlaTKYjRB2O3vLEdqDQx16EIU+kXYSON8Ad
	7j/4UXa3kYBGidpJNrv9lGKgHjCwD/7QBqxFRIEjzcySJRc+HeWFSbbGP8fGlWb8JJa4=
X-Received: by 2002:a05:6808:50a5:b0:573:30a5:f24d with SMTP id 5614622812f47-57330a5fa5amr3799660b6e.17.1794800948506;
        Sun, 15 Nov 2026 19:49:08 -0800 (PST)
X-Received: by 2002:a05:6808:50a5:b0:573:30a5:f24d with SMTP id 5614622812f47-57330a5fa5amr3799638b6e.17.1794800948044;
        Sun, 15 Nov 2026 19:49:08 -0800 (PST)
Received: from [172.17.0.1] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7024673csm8903234b6e.8.2026.11.15.19.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:49:07 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:48:59 -0600
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add ASUS Ascent QN10
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
Message-Id: <20261115-qn10-v2-1-19b11603e776@oss.qualcomm.com>
References: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
In-Reply-To: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=LUWA1HxXrR4NPKGT5Y/u/ot3irTb5NEAz6BiEJu48H0=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBq+n0xY05qmExd8wbQEyvvv4X34w2ppHVBaOW4s
 hROyvKz4reJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCavp9MRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWZLA//fO4O2BuVsvU8yTvSij+l70cgBmCck2rJ1YBT0zr
 /ft984VBjLiWUTElvfvnZ72luCHCTd7mTLWWvKgunLQ2jwcy9IC7/fiG8NtCCu0Wa01TvSdPwFm
 yXjz1+IB5vzGjGCOyO//49Jy7gEn/M6unM231jSSTBWfUuejpXe1Byw3FIeVHky7BDa9ue+ubba
 wiS1K8A8LwlWALxqIVfAuZdCHIsgtGfxrP8zvA6W/9lIn1zc0MFlK7h7A7TzFGSZNILgdqEtjXk
 clUHcftyMW0Sd/n88kp7UlFDO2+cmFelgYFspKMMrPrWDw54xK8mqV9L5mu6v6Kw2Y8dL+IlPgi
 /Dgaju4vss5YUf2oqZIII//POrzIUTVA7JAv49erg6DbCUzR9qfMgm0jNraN1Jziitn3uzXx1oL
 JKgxuqCLfdi0bU9pCJGynn5aVYluDQpeb+9uYdKk17FP6DbQtNXbAKi5TVPnrTJ4AL3DAGwelFL
 ol9KdwFDG/G7VwV+SKXo/mjMH+dDPNG0zonqlY8mczxWpJ3ogsxWGAoqtJYlcn+iBLPoYvd+nxy
 dfF0k7hpKbnU3Nyy0ZulqZOyrTt9duzKm8Sdv6qyuh0B9q281fl29XIQgbzOT+trOi+FzLH6PME
 tUVvGD0O1O8sVPdMj5lILZ/uvGE9eroanfOT0xTHW67E=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6afa7d35 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VllWacnbf50EjFFOaB8A:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfXx51aiqNuHkju
 R07uRAsQpH5/3OSpPu5fOeFv0hQ+mGFuGpseUk7sSIpK+qX6l7ZrgcnxUGNaApHkPJLi7ldTypR
 dC2Mb9nyI6uFnrH4iS8A6GT74BvnaAk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfX2l8fM6z2isDK
 dbqKtKTQSIq6U4OV3LfHKfi/CqgeJ+vOKrIVDu2BU/Mu0w80pZuAFdIdVdoul/bIn501F/F/wcU
 UEqv9Ygi1WCSotcRtb0lnzmwZHCO/LVIQWWrpTKUVKKIRICpOafzB3re5lwCx3s5jMS3BpdOyD/
 mx5jeeBXUM7WccCzat2MWzgV1qPYLnoYhPyh34XyNZbeAQG1iAOOIkTigfo1UlY5PQ5agjwp4ZZ
 fcI636MNl9/L+jg/Ey5kVygC4Vvmi12hHepLgwNw4nTsj/E33pdxyYe9aL7rJqi47y1WR4t+zP9
 UkSnVcn4pb/rrZeSG9JF49ufoiBdEGVCPrb9WpB1aTE8TNSHtElQBPbJHYY67eWf/kh8KbGdRJs
 yg0koylL22c3pJzAkRsWXXPZZG5aUPFXZX3dP4FMGrEXL+hnpLHwd2fDWoVS3gYC+QKqnOz6ikb
 lY49FBYdZG+LxfSbt2A==
X-Proofpoint-ORIG-GUID: I6unwN8tkNa5dgxH1F6ppNaWvk5CU0l1
X-Proofpoint-GUID: I6unwN8tkNa5dgxH1F6ppNaWvk5CU0l1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160014

The ASUS Ascent QN10 is a compact desktop computer based on the Qualcomm
Snapdragon X2 Elite (Glymur) platform, featuring an 18-core Oryon
CPU, Adreno X2-90 GPU, and Hexagon NPU. The system comes with 16 or 32GB
of LPDDR5x memory, two M.2 NVMe SSDs slots, Wi-Fi 7, Bluetooth 6.0, 2.5Gb
Ethernet, three USB Type-C ports, four USB Type-A port, and HDMI output.

Add a compatible for the device.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..a7157795870c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -96,6 +96,7 @@ properties:
 
       - items:
           - enum:
+              - asus,ascent-qn10
               - asus,zenbook-a14-ux3407na
               - asus,zenbook-a16-ux3607oa
               - hp,elitebook-x-g2q

-- 
2.55.0

