Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779873;
	b=TQ2TbFpU+LNlOWy0pQUIx5B7XI9UbxSNo4ElHNmR9beR4YHZhn/IPW/I+6e4cX8wBTxi
	 ajKLvmapc6chjziVn8WEA9YaYrNQRWobNJQMSYLRKkRg+MWmt8ZsI425W0nKvEWtIAx+y
	 ezJTiHxZWqDKEIbY1xtmL7ePUyPB1nFXZ9j2M3EhdOkwznZi+cPA4uAzNviRP2tjl9fYf
	 BxKuWm5LD0vIlzJNbTcDt5EkKPrErPrykTe5jDlSzhKQ5Z/cott1j8zMngBMKMGaXT9E+
	 s1ROvuKcX9rJZU0HSyNWQreKtQe6Z2BeFUcWVeyz8P+kANN8jq6AWRlhBJwnoOgogxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FEX6OHmXYNA3Xbk1r0bkAKzjv/2jynYmSmXZuZBaYX4=;
	b=qtIFQFUtSzadTDxFV6HuBq2egEcxxSju3tmpqQKZfJUTOT5+8r4fGMVHaAHG3oeYLdTE
	 ykArS2ZJlyujDQi7vFUssoJZ4+tHLGARrbBinzsgTrJi5UfeyIyG6+8StDToyh80nq8xh
	 V4NkBnPzEM63CGY3PM9S9X/v/0nKVx/htYGv1m5XYhOgYDHMEBqoGjScgSkRhZ+HwG2nP
	 QENvh7j3GlbeMfXn7jqSb1uRZwNI39KW9Z+UX79nLbO/fnLjGULmvGuwgOstGqO1qiwy5
	 vM5VJpNXM88HcR35YWEWknhMUqOqhu+guJT0j2AStpPGil3AXi5gqoxA7IXyqTELmzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Enb8SmqC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CaRzkw+7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2591B606A32E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2591B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Enb8SmqC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CaRzkw+7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp2n01961901
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FEX6OHmXYNA3Xbk1r0bkAK
	zjv/2jynYmSmXZuZBaYX4=; b=Enb8SmqC6MpVINMF1WBOevqxa+zMuk47FbNFjF
	/YJO8H9kmQMwPSbW6/+JnFGO4JN6Tr0mTN9z2tHY4TnUrSlY2qp2agdq+H7v1DQF
	YHGCtJZ8FoPNFnT84sFt6oo6Ws7bjfp/wAdS0CnTzejFJDt9dJr/9jfTetulzdxo
	Zb6O0uD9JgghITmQg8qrra8wz3iK4xG/h+EoU8PnaQgF8osgozM/KpglYj9RZnV+
	ym1s68Jc/S6daCRyOrOhbUkreHeGFhq1yt1vXTverLWuyWQKG4IRPQapMxptbMzE
	7x3Cviu/LNTfQbddAlSR1+dnYK2qTMVAwq++VTp28XRZim7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4htut7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:44:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9496ff065bcso1072070385a.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779871; x=1796384671; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FEX6OHmXYNA3Xbk1r0bkAKzjv/2jynYmSmXZuZBaYX4=;
        b=CaRzkw+7990+5aNCUxtddp2eWW0eMKbXQEFt12fGvyJVIlwGYCJAeiR689sq0T6tcg
         cKAd+u03GfN0bpLZUbEHsHMrMot3bzH4bLkvpyTnH3X2se857SbmMJ3nz8wyPpcAJ4az
         gdjmmDqv0g/bTtK7CuDq+yDEE5GUvrsDSSLTt5UHfxD8NgiPF0ku2CaCDtDffTpWc010
         FqMsqWf6SplcSxKeqfv72lkMSWZ7WrcBko6J2pvy3SI1SF4WwXRZlVKPgRoO2GToZfwD
         oBcZ6Rg9Rd2GglHRyZkWy4Z5MBA4WiylxxxzCR3Zc1Tnag/ZmgS75IYoDZPagLKWT4rN
         Vdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779871; x=1796384671;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FEX6OHmXYNA3Xbk1r0bkAKzjv/2jynYmSmXZuZBaYX4=;
        b=A6N2FWajn5CGL2glub5S9ExL1oNs/LzkTI0pMa13Hcfg+E8fVFOwcWJU9A3Ni+lZkK
         CW2yNdBp00fYjnYX0GaEYuItiz0iKlbYjBmD1wVsK8C4T5dfAWkazTx2LNigoRKbrKQE
         o+wN5I95qww4JhEiZp0POmb1RsF41ROPAEpbE4VtAa2TsYtrOywyGAKp+nep3aYcKtVr
         vSC5IdMkIQgYYQhm8PjExqnND3DvQt58iDSu6sBi1FtLs0j7LiwG2n3WLQcA4VnmULUb
         N7X5o+YQihJKZBIZsU26jP3XhwzEPVbHfJSJSHC2EmQlR65++cKl0tFfQYIM0iBt64Zk
         nZ7w==
X-Forwarded-Encrypted: i=1; AL+hErGDmahwzLHq7AXcgtzMWjvrfSuOUq8aWlbrA41QAbHWpB0hST9t2bOuft21wxmFqhomCGjkzsYI6zTo@vger.kernel.org
X-Gm-Message-State: APuU4Z+aHiZdUJZCxJ9TrOUG1YLlSVvQ7J7HfHcpJJEFpeVvUmIkDEy6
	PMCK0bkRLXoWiYTg/rQaKai8I7O1zgid2LdjJmClIRIprx7ik/J74Cv5xn0iDzGldo9ANLg4m8/
	8D3z8bBYpsv3+rrKbqS9pYTDZXjy0Gs3wgGBpVIeWk9tyGC9J16n3EqbLvlK4inMV
X-Gm-Gg: AZFdTZcbi7VUPnRAfn1TwxkT+Z/prGD5pII6JPz2/3UtYzrsl+Twz8cUNuWxW62w/kg
	m1zTcZa0ZNIfvraGmMDXN1s9dDF58WN5CoqMzZ8HB3ZCiXoa2brrlp1LzLKSMnnGxFrHoTvnZY2
	Wft4TBjA7Ng9wepGAak9gcfk2Pryq0pMyiCW0YWy07ob3PjZXdzuYPWXKveC1c2dx0o9KYjfocm
	rS64XUHx0ph3uDekqIDEPJnPnrONwwZgb/ifOmudy3pRx4QeW6ccWJAXHMYWqP69gmmyHNWIP3k
	8uRIoEEVuzmfpL5/AIhujeW5autg8sPwUbau/+mlG4Zglwn+gKIWXQV7MGOmvjNQbpmeEVH8yPL
	7eA5CN5F7zaVvUAZMm/rMrFWzL8skBrD49cFPNYLhyzc7CdAT7Dh2VOKnoWCMcDP6/U6mgV1Kd4
	fh/5zH5QsD+EvWn426hbARRfzwX9P+7WSLmOPkeCfdOP5SysuoLNLDyyME8yo5rPs=
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr4101367685a.58.1795779871485;
        Fri, 27 Nov 2026 03:44:31 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr4101360685a.58.1795779870764;
        Fri, 27 Nov 2026 03:44:30 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm46715864f8f.51.2026.11.27.03.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:44:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:44:25 +0100
Subject: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: document the
 QMP UFS PHY for Seca
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
Message-Id: <20261127-seca-ufs-phy-v1-1-75379cbdc641@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABhtCWsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNz3eLU5ETd0rRi3YKMSl0TSyNLUxPDxGQLUwMloJaCotS0zAqwcdG
 xtbUAK1s+FV4AAAA=
X-Change-ID: 20261127-seca-ufs-phy-4929541ac850
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XpXjuNt2nvdXv/PWfTHtjIJh5suL5Fie/ejPzYjt/Kw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCW0dTfqbz3v+boJ+ccBCthzrEU+6AE+JCgjhH
 /hJLCe2NWmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawltHQAKCRAFnS7L/zaE
 wzwlD/9QMgX6B9Rg3L5cY4gCPNXbRy5GbjiuJg8fh+v3si44+KteXgX0/pTSznn5OcbdatXsY5e
 9hYYtIae+LdxRFMU/BzpGMSvVKrrCeG4qgwciid4AtRko368hlQLJYSLJaP5GVJg34+mO2xsfBc
 D6o6MmfHPSnITwnE131q38+v6IB8AOPDG5By21jYb9PfEhmiNhSU9EVdkqoP39Avc+7Ysz0PyAG
 rSv3Y5p7adC3S2Om88HQLfG4yUV4xirzgpkT4s3Z4pU9xgUQQzqgby2huPi9OfLWJwNE6ZcbGS0
 eh9eMJC2IXh4WgSCWo6KyKiZUOxoK1WW5f/dXX7aegweCKp2SKk1LT5jkh9JQBb6wAXYb8ALoky
 Gi4MWzRqfzaYRDTf8Day/8AOBnNt/SCX+s6uMh6Xaq5CV/xgI0lnSFc+PyenjdCNO3INgtJRrKK
 U711hzu1/3hkn06TEChzSjle5YSOj1m5aRwCHQT9maqfNI1ep6AMyfvKc2juxK20m7L5gvCNcQw
 mCq2ShCtQvSvri5eDOy5E5s4f1gQI1FiKKipPUfjY4bA9ma+Kx50VUShS2fBuGgLbpco+rx7GfT
 J79Gad2uYjvONzuk66ILXTDTJ+wSWdAv99BRBb1tajrYqAgIC0COp99S6SSXRfam4B7/9qtXuLO
 2zg3whsxFCwP0wg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfXzELnXgj0bBeL
 PIcQdedsAr8huZ/M0uDQGckn0FL0oVNvSuEcifvwsbxsq4ZxiR3XJ3i5qlC0RBcaBGS/25F4jPP
 +dBGUuCQ/HY23RThMspUIrcFhTOhCdU=
X-Proofpoint-GUID: gbVkR3nMgS8VtI_ISD6rHhm3RkqEzO3L
X-Proofpoint-ORIG-GUID: gbVkR3nMgS8VtI_ISD6rHhm3RkqEzO3L
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b096d20 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=5OrrVIwHFqFdhR60284A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX7N4j/GASY036
 HYo8GJtCwepGpaKFiymahtgd4ZsjxC0HXQSYCbu8se7L70uSUe2Pbu/sXSZNoIf3Jz5ePgLO6gK
 uAgWkZ5UyX0200QBQMmlgsH27xX3wAD4pa7ri/ZVTec9br3wctYClzZZVoyoiHEIwJlnByGM1eK
 /uQ8R5J/4+AglSYYtO+jUbRwEnRPADrcCwtV/PdyNPJNvLBsFmCUo8lWn7sCERltjn1GP28rGb7
 uriL3mLGty6eETpQwF8jpz8JegV5dfzKg+NHlNR2VwxpI+05UuiyGB/6H5N5LD/Hu9iO6hRFMKf
 RObEfdwxOLMlZlfXZ3cFbimelyYka2v7G92ZU1k3/x+wDmxTMeNhZc1S3mtj6dC1cFseG2sYTIS
 SjyBQUX1ojeOErGVuUq9b1OKWRFlP7dXhofFnZO2GLUtBbhC8ILO9Ym4LNcxaNretXSALky4eEA
 Tom2BKql6V9t/fLv/3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Document the QMP UFS PHY for Seca SoC. This is the same IP as Nord.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 10435a0b523080e1043ed670edf5ac7080f306cd..08b0fd3f876f40101ae2bc0939d5f8861f489fa9 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -36,6 +36,7 @@ properties:
           - enum:
               - qcom,eliza-qmp-ufs-phy
               - qcom,nord-qmp-ufs-phy
+              - qcom,seca-qmp-ufs-phy
           - const: qcom,sm8650-qmp-ufs-phy
       - items:
           - enum:

---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-seca-ufs-phy-4929541ac850

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

