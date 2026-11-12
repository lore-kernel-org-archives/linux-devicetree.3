Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468028;
	b=puKKR795lZsRlRbecwfhCoZWvmMCXcK4Ul6VT+QG3cHN2rZFGY04Nr35N+C9aNL4ZTWM
	 Q91kOmOGf8MFvEZp/u847HveZizox13aiUnqEJ4E9hXJaZ4OioohITdMNd7miNF0kY0dm
	 Ok/zVyu+EIJWC0EYGbJ9FBRj/8MS4M5CIshNTBbRJEjLS6YpZsnihdfA/yUmV+8kwlS1R
	 Vi7yhHjEPeSqg85jkrlL3cU+FKaKbkAo6ViHSD3ImBn/Jfk8mb0YLnjk/KpSb3Z+mkDxj
	 TiVcXgz52RgWeRpPermXldkrYJVvLmtjGi46zxLr9gHmeXYTo0Pl7khb4QsCocR0nBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4qfL7piDG4Rh9USRDzIt+sOlvyefKyWytxUWwXJiZms=;
	b=fa3J5VWkKenZ9WPf9ogFkdH6ctK/C/oIa0fd8zh3NyVF0Y3JE3I8cAdYdOaUjxMAHWYd
	 x5d2rWpj77mA0pY138W0yHIKzE5R8p5YhcXlrFHZlbLUd66a/732YWxVj8Yl1y/32RIBy
	 q9D7GAvf6aSy+nNARjeZnP9a0OHBABzX/FPCD/f9y9jlLU3uVjxj/eGOCiUNyX8z6MKFC
	 h5LDrNJlARzjbxmLYV+PWABiE+XrgObcqAm7oOdXOOHnOUrknCfw7x0rXDK5AoKycKSiG
	 HrHfcEAcgMuWaF9upcCbu4XVQ2yq+HnbWyf3dyI0tk3mf43Cn9oqaCP5oYmoBuz2uoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o7kINskI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnV54P4z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFE6606A89F
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBFE6606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o7kINskI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnV54P4z
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5nep2441579
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4qfL7piDG4R
	h9USRDzIt+sOlvyefKyWytxUWwXJiZms=; b=o7kINskIVSfsohNxfhtPNksdu4R
	nwr4fsYh+RohlDcR5574SVPu4Ekm8w5eA/XkoaxitHR0S+qnfgXlNrwQO5P2JJmw
	twkMcpVrjKQllZ+if7BAw3m0cO4WvskP041LRMGPzMoFWobpOltVQlGx+aawk/jS
	TO6FvF+RYnlOw11m0vOZIhhoMhrYURWk8h4CePPNdSJzxt0lxEQbJH1mDtVLhHfN
	BmWuTtLClpEO380/+MTCI+iCU0sRFC+bx5ahid7OWjrH9Ip2/IeP5UjKrrRrD99T
	XBPeLIO2fg0sN+kx1cqcORzaA48SpQ4Cc4FrFPluFxQNrk9Gt/0wjrAuR6w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0a7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:20:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd8ca5bf0afso206134a12.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 23:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794468026; x=1795072826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qfL7piDG4Rh9USRDzIt+sOlvyefKyWytxUWwXJiZms=;
        b=jnV54P4z9Mcv9+V/bGWAEKREg6X6KACNKWBaR5cqKYMTzka8t9KMVpxM9cOpU0+K7o
         ydpEOKxx3dudASJEhuixpBlMh2W/LEa19Tvt1RS3Zy6z+CmeITZ8HlgFtHG93fYCdWNL
         Iwu/UkAIeASSCOwCL7KO1gUX//PL7rNJHG4+vK63A7d16zxYz+HeFo9K8DYhNHJQpuWF
         jJFnc7cdfHt3JejM/icNYfNn4E8mZRpw0CBf77Lx17CGfAVtzTS9WffAuc+4iTyyDItX
         QdEieO6Z6uKLbSxXpERnRgrK/lVIq13AETs8yjtC2BwcUixk7Jfo7sOxfWDfQ0VriCN9
         JM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468026; x=1795072826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qfL7piDG4Rh9USRDzIt+sOlvyefKyWytxUWwXJiZms=;
        b=wIQkcgFZfUM5O3O386W1anK8S4kNDwqMv/EsRf6DMgn7uP/ptINw7mL1Xxm62JkhV3
         jbtu8/P4b0mzmQeK3lD5/eyxtm+00B2NSpfDPEq9iXk8m4Xvd0/RJzCfp7adueRZuacO
         4L6KmOcAuRJamAPD7kJaWnL9Wiy1CyF5t7t52+6qVRomnwDXQFUV+mA23qn+z69uJJHS
         whay2Zod4zq2z28VCl/oJg/N7VjyXOIV3QiUrvBRCZQwGzFh3CvxEamkO7hWUW0QkFcz
         zCh3LXrlHy6C7f/ZFtrl3/VqqX48kSZM4aX7FCW3A8+Hy7W8QE/KPN+GyFYg6jUsNnek
         mENg==
X-Forwarded-Encrypted: i=1; AL+hErFVMxCRn7LYD/ndEJRm3yIfmWVANka0H5ho9RINhkWNUAJoKrgWf/94rtFXXLFl0Klit4vZD2kKTLW9@vger.kernel.org
X-Gm-Message-State: APuU4Z8NorgQGdZVmVJzIxRnRhycmvoE81MFMZAEmxztFMnJiH8irr3z
	LbDyiqFrSjzZvm5RVf3tYdBpC2RMZsO9HOZHOUPMNpEpVlXRdjhdmn6vDS8OzZXUGRFdb75Yfz3
	ZJFb8ldOjy4EW9KBGAVdSxYEOkzDSfZVSxGFFkUVGhAvavVXNZS/ATx/R9H1UPySC
X-Gm-Gg: AYBFou2cURcEuLm4+IU9kC1+kiELS7t7E5gOJMsSDrn7HJhBSNPH+Hz2aqQIjulKyWT
	iZM9/V7TYcKmvfp7+0fqiwHQ+1gkBztCsMskAFut4ZIZZ5gxcNVBlQur5YJViQQPTfglEC7XWLw
	MDdpqlvnW9yM59eHbseBueLGzOpepnbJgI60PDZAS6hFRBmffJP2S/uIN4fdCpoSvRs45Ynoy7D
	PQjktHkYt93Wa+Cmurk16d4OVrMs4FtEUsanCXtwGzt314eDtTwqYECwV6p8Muw15Uhkpkmluzt
	9XvZWJyggzkBEiZGvKTN08unLg862LYj7CvANgf6MNN6sY2apnPSfvjaHSP7oWLMRDdbo/hOlbZ
	K+//OJEcgZvmRhbUXMjDZTUbb2Bl9tRDl0rilQdZrL+SdOjrWb67jbCx6YvRhXfLSfhRgWYvQ2J
	2tWA==
X-Received: by 2002:a17:90b:2ecb:b0:3b0:d0be:f02c with SMTP id 98e67ed59e1d1-3b183000402mr6586897a91.6.1794468026460;
        Wed, 11 Nov 2026 23:20:26 -0800 (PST)
X-Received: by 2002:a17:90b:2ecb:b0:3b0:d0be:f02c with SMTP id 98e67ed59e1d1-3b183000402mr6586876a91.6.1794468026028;
        Wed, 11 Nov 2026 23:20:26 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c73e27sm3149185a91.9.2026.11.11.23.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:20:25 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: regulator: qcom,wcn3990-pmu: document wakeup-source
Date: Thu, 12 Nov 2026 15:20:07 +0800
Message-ID: <20261112072009.3815276-2-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
References: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
 <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IbAT7i18Qy5nIFTMhfK_K7iar_YlsLyO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX0JIv4MFQlb/B
 3bSCmZMMqPFvqhtCyovemomfbhbmxN5URGoWrw6NrZakQIksw/OgOga8OoH1soHBJo4OlGIj9YN
 oSu1iMFb9yETvEivat4dAx1wEreLX7Y=
X-Proofpoint-GUID: IbAT7i18Qy5nIFTMhfK_K7iar_YlsLyO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfXyXt2S41B/fVe
 1mJMDylSJ90x+8PMQwsfq9oNRZHmBGCGKF6UzWWP6dxsU4fRHEB/nhKyJUHfKBMFO6ASUXV9CX7
 ghYd72TAaShtRYsj/F07eQqwOT0QJvTluTX9GOHKOO6HjgyCTnAa6ol1PGpqH/r9eZkSL8Vh1z0
 fsU8eG+CYOUfTIsNdIiWY7wdTxq4Z7N2HQ6KyK/IdL10WqY8I5Plwonk3LRdqX9eb1xQ18sj4Fa
 mmyjak+MxU+BKlGgfD7vW/FAYVw+k+Eh4MevNwVbLuADRSHHaOywWFwEq+XjKLpUcP4aoKZa4Ai
 aNDQUcYzDNhfiTXEXHqszVGm15eykD3hcHTlYoqHis1GUsq+mXoikd6RiJtA0snyuiYAApbOUVn
 YuOM/z9lRvl0dJmqP1go9s7Vphn7mYGTFoG/+EpXfY0gjhH5nClya7GbLM5ZqP4APAUBvbZBPrm
 0EiP2yyuJQr77mzrTBQ==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af568bb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=brVOnVl_E7YOJ4RIXMgA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120029

The SW_CTRL GPIO can be used as a wake signal on platforms where the WCN
device needs to wake the application processor.

Document wakeup-source and require the existing swctrl-gpios property
when wakeup-source is present.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 .../devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
index 9a7abc878b83..f0372e28c99e 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
@@ -42,6 +42,8 @@ properties:
     maxItems: 1
     description: GPIO line indicating the state of the clock supply to the BT module
 
+  wakeup-source: true
+
   clocks:
     maxItems: 1
     description: Reference clock handle
@@ -67,6 +69,10 @@ required:
   - vddrf-supply
   - vddch0-supply
 
+dependentRequired:
+  wakeup-source:
+    - swctrl-gpios
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

