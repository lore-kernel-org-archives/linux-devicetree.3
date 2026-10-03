Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B863909AC
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 09:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018156; cv=none; b=gmEo7xt9s0a6trs8xD0Of12Yutk84+CJz/yvHhIYiosc/U6JwPPKUeJEed2d0e5dgs6QEQyoDmGhEny8Ao18/unauwbrzquiWHy1xPMuMN2cx7FhzO9EKF8o46lS9M4FeHTuOBKk7hDZ7cJ+bYErYjDMVHeY4FQGXSFS2K4Plao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018156; c=relaxed/simple;
	bh=zsqdQtklwpvdbiVBw+YVSyi6bmJpPl6N7PlUwRG4pvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WGQJw75xLzgF57qqK9snVJAr9axGNakjXpn1WQWFOZ2agKMUYOmoUIo+FVrKsOl66TGeO16Db1ha0qyQ5UiFbnHzeF/7E0g8u0xN6fkFkq5OF0TGdAyEml6PRUy02A5i3AWioLBxIB6aoW3TY9bKIUEfWfDtF/m0CzLvIwDb1ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogMdz9dt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfhupzPr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogMdz9dt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfhupzPr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933MbIc070400
	for <devicetree@vger.kernel.org>; Sat, 3 Oct 2026 09:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=ogMdz9dtnkNt9NiF
	mncBgZrkk/PbUD9dUTBN48uxQKZ0MjsE+/0BLq52kGWwc7i9SmWmQzLIkrHFfnkE
	Nk6ma7f+QHUDePJhOclAf2h1ztTTDa7MKGIzHhTf5VmLTjKW9MBTjlUx071rwrlc
	RuZC4foss+uuuRfWLTy/9T8hqGtqP2WngEbmDbulTbM+Co1/ml6oqQWWtQoWqDF+
	d1ozFkMRi8fUZ2r3llKFKziBjARrkFFbd/J001cC3Gw0umXEPpaXEfJ958jeAz7D
	brtcH9Hwyq0ZqX2hgbXh+/VfTh6e0eLgH6JwuWDy9uUMkDm2og5GozS/+X0gj1lK
	nPVFuA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sr68h8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 09:02:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30f1b904861so479210eec.0
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 02:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018150; x=1791622950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=dfhupzPrsz73Eq+JCKZhojCkVafMtx0PiadT88EW3BeRkoGgfJezpic5CNM0HGFFgX
         xKCuLXuZi3uF83fWs8Nw6VMTpu8t0t8j+VLWZsdD3M0/WMFXRJnu9DRkGwsTvcr2cOCR
         wmyRELkYetBnvGuODxzlL7TxqBIbMJAo4TNlehqDovx5pIW/hCfWjBQx0tlni1PpcfNs
         VV9+9j3wL3FGMdHBecuU+eV/j7QpO9ICNSwLYNXYd/EjkQTF6gz+iFAS/CgdDtvBq6bg
         aLYL7NNU42acNmh3DMVNx6snPcXbDPA3hmHkdvdltnm++IpPw6GSYMqlHNBgReJJTeVf
         P/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018150; x=1791622950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=Zc6bwzJnRQ3yJbgdgE8YhtTbxGexg9EUJmZyXDS1+LGzuwshvEtkh0NgRRH9KEMG9/
         h9l7RJiEO/K3NNVmVj0Q+5P1WCNFhS+pn9keLNnxZIihCgmiekF7Nl5/HiCeNdJpNVgz
         eoQ+H4xzj2RYYTQ4N7lxc/hwioy7m035T7UU3tPsqBqo1agWto6+xU1deYKJbzZceNtt
         nydLIPKkmQ4aYPsKX6L7MbryzEVnR1H9rekXV67Zc4tS88Tivr17VcTUemdrxu6/EcEy
         o4+wC+byf5UoCcypvxSXGsKLTxfTOFo5VbpN8L7/wSQtKpfx+E5pp5ggMRMm96EwrgXJ
         vddg==
X-Forwarded-Encrypted: i=1; AKwUvBw+Mp2hZDeiknhhqkgAcM7ygq3OA4nW9MpBwXdvYrgCRhmjdg8L09SetCq9OlXrw3Lu8ZfE061F48o8@vger.kernel.org
X-Gm-Message-State: AFq9FYJL/VXyFHGB3UudmkYn0FaKP4ssQBdsc2urDoFutX+3ltZHNl5I
	rMYdhThhAZFDTFPxlsWWlbuyIqG+wp67O7SdZk89JYTMKJmuh2Jpf12S0SfPHgecDbGJsCkmw2E
	3udL5lyxWSuoiMmEbDTEgQjdzh9EM86quSZWm3tq9gijFFqBlGTdksE8yOcm+Zx67
X-Gm-Gg: AYBFou1jR2Z+cPdGvjLIOayrmnal9elbtTAVmIxNFSdqMSHibUuWnfMUKPNmn16Y1kc
	j6x5a8OeSRrC2xFrlgRCkiKgXUKwV172OtNFsyBMpU/+6dwwaktPSVvBinOiqG8Wj216ziMPPIo
	EB5inO+wR44SsoxEVoVeruePoB9DICdg30e0AWAMms5lhj8zyXk8JFfTNXAWCySC22+dWPxfjhi
	gry89Le2jLVfotel0BMYLbvGv4tRL8GWWzMaIB5xlfz77oVhc9kxYhtzOxujsJLo+eVXpit1nBC
	FO9Lotr4vtMyU1sp/S1qrgcL0grzzxLLp8e5sattBqI/cXBpjOmudOnBeuKKV5jxTkx265BJPo+
	5tFPz9JBh2361IRgUuFPwcCwdV7xR+EeEWarKgOn3AK0RHdAv7COjEiuSWBlTTqH8Na3BCUBeNh
	LCganG3MUDSA==
X-Received: by 2002:a05:7301:4909:b0:351:1d8a:2bd4 with SMTP id 5a478bee46e88-3511d8a3743mr24973eec.21.1791018150128;
        Sat, 03 Oct 2026 02:02:30 -0700 (PDT)
X-Received: by 2002:a05:7301:4909:b0:351:1d8a:2bd4 with SMTP id 5a478bee46e88-3511d8a3743mr24919eec.21.1791018149567;
        Sat, 03 Oct 2026 02:02:29 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:29 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:12 -0700
Subject: [PATCH v18 01/11] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-1-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfXyNMRz7UkQGgb
 7xyMOyCyRc0ZNTXpo5vMnlhnWpo+7uNDd349QbZXqn7oXw1MijvlCr2CDaw3BF2lUU7i/mr23Mw
 DK8xafF2XqnF/BorocSSiFy91dzxaJQ=
X-Authority-Analysis: v=2.4 cv=NaBzRGD4 c=1 sm=1 tr=0 ts=6ac0c4a8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PLppulqdp6asvnlJRPkHX6hqw5kEDeF6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX7yafrJutg2ut
 Wq4WBslDWnZGVzfra7yYmwsdZYPgjYZ2N2PComVZ7y8KJUNAmobHiFSU2F9Kx0NidsYzJkFEpBS
 RxMSfX181La9FeSYUBlTXAVf3xetXDTO9sGWOcUZUj5lZUP9H8YtLeKtkV2H8hghdcVyRH8wTZ5
 x/vQouBjkIfgAz8Ppi3wd6WBPOy+AGcX4ydpJDfbImOt9b6XjEe+v0X0vCurZA3Qa1d/wJbIidq
 B0RTQeV7otdywcSus3OT8t2Jw9DDthNLDgU1ArXlU6syeOH1qWOX+z/xqKR8tMIJp7PDu2g7+9n
 tU3HTfOPYuArTcyFJZfVbSDPDw3wEHDOHULaYbjoukd3cRzVkAXnPbZG4F+5sLi0tPpkvudHm2w
 km570JoGJ015tHSx5dh7THf5EyWQJ6Y+cSkvPLpXer+aWz+5FNyVQnCUtQEb5ccIQP4pRTO4/3v
 b+7kdW+5qQ4M6agwnlQ==
X-Proofpoint-ORIG-GUID: PLppulqdp6asvnlJRPkHX6hqw5kEDeF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030035

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

