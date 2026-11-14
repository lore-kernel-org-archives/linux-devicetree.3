Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655831;
	b=fsYJX54BiDg2ESvKT7QOnzGFNVd82s/bcDb4/hkX5nddKy4S7mRWA+RreC2RGQ5to1oC
	 DzZAgTq+qb8b3JoUGytLuYHrCM95FW/XBTlCb65s8F9xQTuP1+TmKblXLFnACQi3+cnIK
	 8vdKCEOZgGvM50h1A51NJ6583kvwmOVXbwBEsepPpqCh6Bm1UmwCdXke2P6QkZDZbBXcL
	 2HAU2XbFQzsNUhFTCKwoHfKizZHxgHe2alSArPm3qRpr6tPuVLevCc7zGRYBUuNDM12HY
	 l4aA2cPdCew0qo+66KwBJLfELVVGVfpIWrvj4qiHfo1tNakkXmf5A/17O4UOBCuat5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=;
	b=WNUWRJ/sDnpZlthsWlq3E3Ra7vgMMM8QMLIOQGmsqDVf+MgraBeWp6UmI2f12PSA34j9
	 /TH31HK5kz2dN/mH1DGT8Ic+o2Wt49nwgwWDVDjaWlaKXKrVUPVyFfSghlK2Ygm8lTcea
	 /1xw6QsgQaNP0Z6EGSwe7zV0V6+K0dgpGD6dMEXcL2CU5XHidqnIlokOl6B40gmBfYo0s
	 rsYO1thjbdO2JR7rWAhP2vjLuQneCoZU2s/gpaBwaq+2S7FGjT/2aLjhx3Vhg4jYA93wH
	 8Bz42qGWgcPl0Gf4OTQtz5t7oKTEv2D7V8GGHC42j4HJ9c6bM+BmRn2NmXKZ0a5QyCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UMfat2ax;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YAWRbO2X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83871606A327
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83871606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UMfat2ax;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YAWRbO2X
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wX0w174146
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=; b=UMfat2ax+68EdAj/
	tN3OQH3rgy2YMQ7HZ3iUEIoolyUOFJyB9OYDkFHOJnY//GU0Sm5DsAPtFFtfFTmK
	yJABxKn4Xg07JqPfLUxDivHhVzddOr59fr+zdO0x11qOER0GaMcpI1YjU1W25wRi
	v84PQwwfWXgZyCr7yVP3GPZURGj/2H2kHmHATgOqN7iPXoQGnLdbE3zRitsZ1Uek
	2ar2e8nRTbxfbO9nYdXuZ7lSDraPgL4UK/7JbVWf0JJ3m9bOjc2gon+LtUNY8IqC
	XgZmR41ifzSDtkKWKcuoHsjf0yQvsHYyexFpQCe1JDVIZke8XaVWZ8BS0oS3Lq5S
	8SFPnw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmagkfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:30:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91f03ea17f4so42161456d6.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655829; x=1795260629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=;
        b=YAWRbO2XjwrEofSNKRgJ+tdVY94h2WEcUXl2+DrXlLWHmWmLTm7aXB66nqV9XQgYKU
         EVZ8DdA+TG6F8hUQ1Ox012hue13MF30WnNsmPNQDVnv3tqxclPU5fum6dNLcH42c5HLe
         UaX6S2Afyb2HvqfEQkA0LIoVBdgO5hUwo1XWIu2NnXeGIaAC/ipeFNffa2EYdC/c/jqe
         WaW3CSGUPc/056L6WYpyF3c0uXV0PhUHv4vwmjOGNR1TPWH6R6FN0Cocn0ONq3U584Cn
         7l3mzsFG6Hzhhxf+kO8paHNgVRPGkDPGgx5KUNu26QGg11QhnayfamenAnN0M1gyAq8b
         CR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655829; x=1795260629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTSf169frfMjFZsMxW4csMunjCZN1T8v74xtvKaojKc=;
        b=XLUk5uwLpfPr6DyH5k3A22mVhmVjYs+k3vuLULHeQVhXZ5eLXtcKgYG/ORXPOMHL5w
         a2fUtWp2iTUVFEpDMILL1s274ePFi5BS7688Qfs+HMVnVg+2RSKCz6caifgxSF9Tcc/9
         EZMOGGKcxfG4MfFWAAb6o1gLLQWaQU4BKQ2kJG5paNHp9NceeME6Vh4AWAVw4+Web5R8
         EJsTo5vtv+9gAilXBN9SKazXjobSTVEUW5wLY3r68tQpJwi1zxnOaq+ZKTA3QMmt377h
         6Ue9G+ulWldMW0DNcpqR6GjhhZZTU25WSKOaLdu/n3knutdmo/jnsU64/wiqbZ/yJM74
         9p2A==
X-Forwarded-Encrypted: i=1; AL+hErEOoVioHuz0r6j5OA3XzMGZTHbfAlS8BGlkQ9qKT+x13mdSjSLYmLyMZJSk7/ftnsN7HnD0Ld3pSlUM@vger.kernel.org
X-Gm-Message-State: APuU4Z+/PkNxx+4BPsG4+WB48mfUvtH4Y2h0WIqIlZYc3EDWpl8jhyYf
	XcVwwzyODKFmNQlEY2a8shwF+huGjyERVpSZfFJQ39QZv6OiUDOe6r+UsEcy56jGP7m5CZmkZBI
	9452rpG3/g1Fq2IL1iPn3zu9WhMmyA2jC0Das4M+AUwd+yP2IR8lA4UX/cfYq2/tF
X-Gm-Gg: AYBFou0HBFsvKBO+89GQ5uoIZLM0Uff7p4PES/b84bwJl/ivjESsMgXBXfv40SPI/3X
	LeXgE/AlYSSutY1iFryZ5UkrnXitjeTQlKxw7m7kRmNsZWii741uSiRvWs85GDezmUvPFHK36Qn
	zo1WZQw7u2SWsYU7esDMdvwGcNrPHZmiR/S4sX43v1MbdH6EEoq03UzJlf28wDQRfGHXYUMKWbp
	HVlMGy/SnufHN89qXxCGoeGUkgbsi0RR7zCwjMqkZdH14GWSyVmT6iT0wUAlUs0zaCeIjuRomYL
	LJwmOeHnZLE2MrQEcNXBURls1dpWTwaZ/A6QLNrFgLkP5xqBlY3Nh4Uu9VjymIUuAIlIB6HGAmt
	6T9yRIgPm6C8Md31ayN2LWGxL5pP8UpIpat4nFJaj2nXgyipo6zUACEnTefulftvR8Wp70F6tIe
	isg5uu5sTEmq8mvNisAq2kTGsIXByqAyk/ahwUzAa/
X-Received: by 2002:a05:6214:4a88:b0:91e:7d3b:4dc7 with SMTP id 6a1803df08f44-91f24294007mr84960496d6.58.1794655828837;
        Sat, 14 Nov 2026 03:30:28 -0800 (PST)
X-Received: by 2002:a05:6214:4a88:b0:91e:7d3b:4dc7 with SMTP id 6a1803df08f44-91f24294007mr84960156d6.58.1794655828431;
        Sat, 14 Nov 2026 03:30:28 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:30:27 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:22 +0800
Subject: [PATCH v7 05/23] dt-bindings: i2c: qcom-cci: Document Eliza
 compatible
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-5-8ff2a11835f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1069;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=61yDOYkYSQzcaMNW502STOCKhR8JM0wrwP3tqxLNiqY=;
 b=ZmGzJUN2j2tTw0MqwLjAcolX1NvdlwsYsUMfPFvO3fQNEEChYTiWO3sjeHeQOIt4y2OG5zUEe
 CeqCoKP/0ZpDr+LXQ7U4OzMgWHKzuzFtWvMJMaE+uaKoldTk+I1xiVq
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: T0NtMKUx-zjJFnwl0oqBNqZBXkYmW6Jf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX9q8vGuArvVrp
 XRONNornYPt7+IRwXoEGwDktTkSKL7obZbyG0NG0IsFbZWUb2ydmwYYG8aOlHJenyOOTXIOX7/J
 EY7yt++EljyGbtGS5JYqS/FcJmDs9mSXesVArrh5nC8O89IslmvYyR08A1/5O8Lb4OY/MQo2ZPY
 HDpxywGLPXV2Xuueyag7DyjE2V5cyo8YC4TE/1wcEHFxEtHZvoWQLE/THWKRJAGDapst6RWpLpD
 VwDxlGxOJdfgeY67DBipI4H6q07eXh/VOQubKjeu/UW8Y9Ez85m4eAXMHo30mvzCAwRr//Lybnv
 ZCgKwYTqI8StbGtJSs5dy0QZTJV9ahoKxa/5j3lsKY5p75YiuDPaBhy8lzZn0pd9PyoVx5FU/Vd
 PMxiyu/eU09IH9KSgWeH5QmGPBAqmFhucvunwfiqrAFgh98URznzXIgImPcfYjzp3dr4KpF2BuL
 G3qIzg11bDuflyWqktw==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af84655 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: T0NtMKUx-zjJFnwl0oqBNqZBXkYmW6Jf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX5vVTXs7XH5Hi
 vpoLdZNTr81JG/z0q1treOthuZHGevGqrCkyta3Q2sEbrnjAlScj2eL6U3oIQfzm2gYSk9/F805
 0JDh45itZTKhzM436g9Vzt8Ou52vB5c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Add Eliza compatible consistent with CAMSS CCI interfaces, falling back
to "qcom,msm8996-cci".

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..f16298d94177f906790c18831bfbcc5557a5accf 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,eliza-cci
               - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
@@ -136,6 +137,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-cci
               - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci

-- 
2.34.1

