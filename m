Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655794;
	b=Vs+MFdhs4d1FO5TiBCU285VzLqaltXhKvjzLd/HXAoGc+T466z7iZBgDUAiKjvE9UlT6
	 xBwUrb+BFyK6cQa2W3UtyLRYbB7IpqAGmMYv8uA2tUSLZnRLteZULlOts9z14geLhiRK9
	 cmImgAEfzq1dfYvjwZDWOpZA5kElE/14LXu3i8mldlIt8Buo36e7+RapeHX1MZMiqMwl3
	 ZGkMLPyVk+x+JaBeTarK7SLEWNmInqYXNRP4V5hjYk/Xqp0z0xEEDi3cZ8BphbL6T9uvh
	 5AvUnZV5unPvsaIWsEtr3lkl/Kdoa5VLgtO5daVw83L256xrf1ALRDp5a6QjT39HS9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=;
	b=AIWcvFkFUi1s9RRt6Pofcw3iyGmhUV1pcNaD7RR+KrYFgWn0g8Q11eWxHm3MvzSo8HQ6
	 9N/3m5GioWZ1LWuUvFHcA46CuI+0tWTE1dicQomT9AKAKod4WkhVkBzh4mYhxY3v9VoBU
	 IxJok8t6dZdxK6Y8nL4cGJnEOD1jUZ3MpfpsfDDV133IqhZR819NPNEi9ox98jGYBQ9TF
	 96UcklxtTFdfKEkUtzoDSFGmlj7QlNSQWNP0nC8IqZlT9FiQPsSflvGcHEzMjmg0o3vbj
	 nBEDCdXn1H0tznoHJ2IwGoFtlScDu/AoiQAk80JFw8lFcrU3kt2l2EV2xu8PYkm862Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKQUzFz4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTw5mjsl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554EE606A32D
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 554EE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKQUzFz4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTw5mjsl
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wOb72055232
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=; b=eKQUzFz43741krLN
	/oALLtSYyXkq0AcsL/w4XtHfQeZ5csEulv5/mfpFFrY/JJKvqe89fx/f2KSIy+eJ
	dISWagwXVvYwdrmxEgJKlLjP4BRroC9WQU8rXEIBjFB5NVm6p3jYJZAgQzT1jh6y
	y6yNldtHt2cU5ks8MQhQz+iABPoDl+LWmxBTIGkK/+vVPo6tUsfWgQrH7L9kBvBC
	BbZxkXQAC59IKutjCFhj5Hmv0W7oNolY7E95TBTBcGfEOsXLrNls59VgOLQL7RGE
	nAX9B58UXLgmi4qZwcku7szYxEiS0Lp3LGNCnoLEyS7Shlos+vN785DJchulAnly
	gwrJFg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmc8kbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:29:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55cc3c32e15so2432071cf.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655793; x=1795260593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=;
        b=bTw5mjsl2XeBSnAS/SP8plkBB0HwhuPDpySTU9WUepI10qEYFfjN8fAUhRev7vvGIr
         pW4ewrNwYbvXA3gvIApABSuJuf5UoBYPtfFqRDFRi1CoYje7qp5TZzaOs+7zMDBbmXBM
         RUkAricVyd3Gs+XBAD3wdcOTnqL9sq1QUQOQsul+51BFtUV2376O0bSDl/7dyr9v2ckm
         5MByhdwVK9BEnCyqrsPUZsl+JZCRrwSbq551FgLYZWtUl9+fBe+AHHHHIUhYcgb+N9QB
         TN9Bzy1SjQbZgpmghBxhaat4ard3e2rRpB7ZIROMy1tvSLrz/dArSiCRqPwk8ATyFd+E
         WHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655793; x=1795260593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=;
        b=KylLndyqYr+mzJq06RSLuaUlz75s2qVCmhIGQOa99064imT8wmrT5NL9UHgbjcCysF
         bpbZvcTmU5qO/5sAv3knHzL1Bd/n5IMOAMFrU74SgBEAhzFUEjWUaAAw7uJLn78w0OxN
         eeuaTnbGfbcRIJhirnZrSr2ZnfS+yZcB0ivNW6uSncU3ZRaeLQgH9ZFTQdYKZQhRyqAK
         n3oJR970R8RuXB0LRkOV1V/WF3vm3XycwYcsXHO2kEGcTPXqGe4YmXl6uCoR40wSVu0S
         BAIAKzGMTzZ+amIG/yBIx/QBERlNUpPAHuQGt2KWr74Km8KXZJ+nkbKKbYMULioQwHJa
         52TQ==
X-Forwarded-Encrypted: i=1; AL+hErEmZ/4CDXICKxq7aQVwH/efpDr7DxLP0oBIXVaLEBLTT8nIViI95DEDzklkTy/pQP3/RiP8d5nFbT2Q@vger.kernel.org
X-Gm-Message-State: APuU4Z++iukOVVFJXu6CvweO9cLS+U9kFNzCxq6FUF5w/CLcb2WjwJif
	IsHv3JC2KNJaIoc8198p7OL8WUbavF2f7KkBXpKjSE8TyqQi/96P4AwmvO0sdN1ggrP47J8ozid
	EEbbMkNg63UxlRh/Xk2wAG7c1FPhDoN7RDeVaSW6rjT22VR+zyn4lOoEYgV8CDgwD
X-Gm-Gg: AYBFou2D3aGk2La8PrN/Jw+VzsLMEwJgQ1IWbU0TnDe8if7tRfOVbkFzNDqXgvKgq73
	RhpeD7YweKBHsPQOiexgfJuAV3O1+D8EiPtllf8TOGmDcQNHBm1xmCt4IOqNiJ1mo+cM4KKAq0V
	1YCWbmS1ZNjT8c0qSiOE4U8PIb+gTUtNSbEHM2K3TnCYgPumkIBXi/0ZJ4A7o6UxVJHA0C2yBCM
	LWLI8VAg0RMxwsHAMKFp4SGu3oDgYe+1J5LFyzbZ2ZR00pGf4xU1XN7lHf3rMuKOaMHiOnuNEGx
	WNEvmDm7Q++1oLzlvhVq7IqwIB93LR8NlNybxIobf3ToTTY8EmRbW0nU61JT4S7M5PHoN/S9F5X
	k/26wjZASTcMCFUpQXNV8MKRgYj4i3TLL1ZmGUsTgzLH2tVusClun+DNnNexyRHVUCCmNjFXR2V
	ZDW+hK15fxpVjPHNtgn33hJjWCioa2Vd5dPZSTLW1/
X-Received: by 2002:a05:622a:5c07:b0:55c:37c1:aef7 with SMTP id d75a77b69052e-55c37c1b4b8mr34089491cf.77.1794655792568;
        Sat, 14 Nov 2026 03:29:52 -0800 (PST)
X-Received: by 2002:a05:622a:5c07:b0:55c:37c1:aef7 with SMTP id d75a77b69052e-55c37c1b4b8mr34089191cf.77.1794655792088;
        Sat, 14 Nov 2026 03:29:52 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:29:51 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:18 +0800
Subject: [PATCH v7 01/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1075;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=LFc6jx+MXDH94lWI3ZDmmoldzQASgCtkGLGfmGw+wwg=;
 b=qQbMkxieG7t3MHs39IJqk6/8ONMjTaPIKB7+zb7r390+yjZnta8SFA582Lw2EtjV9kt1MoFe7
 ZbB3RdBwSjZDb0AfWh6sGDhV1szHrA9qdW8cpbOGDDd8ztsmVi4NfG3
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX+haZHfUmWpMz
 VCBPSoBGkGDQl0++QRh4HguW0AmRi670bNcOJgL0M1GUMy9aCbboRT67sywQyNoff/7lqv2WfAL
 hgcyeJoleFCLLMQbL0EgtjCbLc2tlyA=
X-Proofpoint-ORIG-GUID: y2RUFNQgJWPaJDdSxDd-qO1x4FnUoLq_
X-Proofpoint-GUID: y2RUFNQgJWPaJDdSxDd-qO1x4FnUoLq_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX42nNzLlrK4FF
 Czhcm6CUndBqxs2GGr1rZtSyCoqUdLS0Czxs4GykcEa9BlKC4jY+uA+EfnUcJpHJpoUekRmd90r
 VBaWOBnu6/R2o/HOCUmIb623rCAwaWknw0ON5giqzoyMQYMewShQgmLvtFY+98al/ez0m3nMfEV
 jx331Hyg8lOvBPk1lXa7Y3em0Oa78o8ekh1Z+aYe05SAvhZJE2YgZkuUo1uWLh8/Kl+Vp5AZvd0
 kA5oNEWpEOVg+oyO3+AQR0SUjbUIrtY9TeVNz1wYKUKkYhTUrOBSn+lw3dtl/rUw2g6v3QQ5DNm
 eGrwKpd8qMATUR/jm0CWFrVVbHTxuPwp2KXwO/iHT8mHqAld9UzB1EGMzBkXapnCNJePCUFaLRe
 zQbYIhDv9ZvWl4cQTQvcM6eobGbDHsXLL5ERAdwzqKhEIxkT6ZgR6fC7wp9A21vVgBaInRtOqsw
 wI4E35uSx/9vamEJXbQ==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6af84631 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CbQ82e2HgpuiUCsW3z0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

The SM8750 camera subsystem has six CSI2 D-PHY blocks. Describe them
with a standalone "qcom,sm8750-csi2-phy" compatible, so the CAMSS
binding can instantiate the CSIPHY nodes as separate phy devices.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 6e9eb8e265df93b631101ae13f31f6365b6239b6..8ff3df1d0d2787b2af0499c1e4106b86f56ff82c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,kaanapali-csi2-phy
+          - qcom,sm8750-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy

-- 
2.34.1

