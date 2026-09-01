Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F55473C76
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250090; cv=none; b=Re8Dj4g3ORP4SED17ZW+gbZ3MiY3LQcCkgxzxfOn27PD9bHwJ2L7OVn2NtDSgvKcmfzuwhpaXqJmvF1GcjPqaQrWPbHk0FojHZjvFlCU8lO0dNKxK0nkP09Tr+LQ8fHNo3JHbraZ3OWGwvZI7bLzk4LGQh6+0cyAAnF0AkGq3FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250090; c=relaxed/simple;
	bh=sBae8R0vKEkozIUJX0qR+welSBPJeruryo4FOGtusrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sO5sCiWuGy/9izRYlhnGC4NLwnxr/PWbHPvWPO/uHo4ICE5MreJzkpX2NNpkiLCmd1ZkjMJ+WeGcRMNbkUXKz0swo3F1n9nFxF2NCo7W84WvDKpj8TZgbBWfCm3AxMrFp7a+db5o3AJW2ZtSKVs1uA/Sp/F/3GztW1wwnY1PD1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBQuU6By; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOkK13BS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBQuU6By";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOkK13BS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179RCs2322015
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 08:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duCBHsBCta3oYMOh90c4POqqhq50/eyJ3BOcaXl7OIg=; b=OBQuU6ByxDXvGxAy
	GltdBWdhTiwl/LA/WAjgjNAM3pH2v13BzPywaOyufi+8puamuJMBwJbtJVCRjRO8
	SPoEa6CKNfYGKcJCzF/ezlRgrWZvbIX/5FKJRK+sBgotrFfJ9xoUcodl3R72g3vP
	HRnb+o3/lRsOox8aPXXoFtWb6jUYQvB8JTF99Be5kF27/dpieso5AzsFgwjnVZmH
	e/bW3YgkPtvYACgnVJTADFo/AfkkHZ9XcQQIbpAFQulf/uRaxeS67qkQKYpIxYnx
	C4oczWO4Rfp+AiWl7OwyX428+pvU3E294GnYxIeEAaDCk+6JskC/1OJ6qnUMlN/M
	gpblSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchau5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:08:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494527488so120520385a.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250088; x=1788854888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duCBHsBCta3oYMOh90c4POqqhq50/eyJ3BOcaXl7OIg=;
        b=UOkK13BSKNVDZL1wxaL11vyn1AtwI1MYmHxrv3dwuRQ09re9zEbelJUYaQfk8P4S9v
         vCYIpDVEV3FiDnNHc+U08TXWUMdM63rtf7Sz9YRUjpllHme8otASfARK4aDGrbJ93Gqw
         ifNj1+F0Qjmsew/aJwNec+59FFj6Zv9t1fGy8x2OjneJlX7qd9mpYHbiEIHhHHn3U+Bu
         C9eNf9oi5pbvPryG/A2h3x/piRwcw9cW1UZbRTGSbVkGWNyBX99PK5b+LSgSYVy6Ax9g
         AecRwPFAThCSMd2Oa9MzqZUVBzdS9+Dg9PuUkSxBtS4sTYQEsJdbRdewsGgGpV+dy8xT
         hPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250088; x=1788854888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=duCBHsBCta3oYMOh90c4POqqhq50/eyJ3BOcaXl7OIg=;
        b=US1WOiW9zBBxlz3Pp+7YEY8W1yj/yRaTxGyZwPkB848k+hOPvothWwlgiH9hymFFwC
         N459fF756BFZMpsMiRdl6z+WBEt4dpVCvIxAXJAWlgpv9yLsI6W5fYh23f2Ta5V50uUF
         4uduuD/sp5opG8/AqnwwpMBKoUCYfJxrH1z+ReqcW0QbXt+1JWYQHTNg/CfvCKfaanJh
         EiUsNLdV/6h4lbymsUyJN8dpUe311DqqxsyKP1eAegrnckTTNyB/qPPidLmOmLMG46lD
         Kxam83z/C3u0IhE4bdpCFVOeoWohz4pmngyB2cUDQj9U4F8CWBaGpkKh4T/1CXShtJbx
         8YFg==
X-Forwarded-Encrypted: i=1; AHgh+RpUU6ZNYrour8htoNnww0L0afglDCb0TkW7Hk+WIXATfqvTVTGyG4Sa47sUsgttnlAd7KUddFyrZ+3x@vger.kernel.org
X-Gm-Message-State: AFuF++l6BEJeeCNfPqLuaeDIsL52htJ+dDfA+m1t8Q4HORkXyyTg3itd
	8BaMYrjsaNdWxiYI+EykIYxy1a3s45sADN5llKTibUzhdypuU4DenwBWvTZ3JesiG9OVqy5pgfE
	trb/xVIoScpOcg9utAUOCuF5Qf4nO93CuqlQ21CshmXsNy61JP6kVkwgvgBGpdwOF
X-Gm-Gg: AR+sD11gsaHfBLGwXKpTwSM8m6xwaV8OJFgY9hzxIEzILumWTyGdK0A03dQQwIH5024
	FcbEdw6bgZGuigX5Hu25v5Fyq20byqUQc+lzqGWBLaNmwMk7pRPxTULIMo2c6WnuWEgzIzfcBwu
	WIQ9rPrQ6RL95YVWniSqmHetilDts36YFt0klXNEgcWXG9KFhTlrp5dIn0sdWXc5UhaoRLwGSeQ
	nsNDOY1qqhzotWRCjrpi43lGW9eNnwqn9Mk545lcTkjq7hXq4Up8cBh/M3m0Z9r0x8+a/CmTECz
	ST+oKXy5Ud0Do4yufBq37TqZvyEsipx8ReX5XkOOdeW8kZu/vE2hIwxdM6UARLUlR+ylB01Buo1
	GwLDhWhtM
X-Received: by 2002:a05:620a:29c6:b0:92e:7383:4a93 with SMTP id af79cd13be357-9391395ad22mr3407166385a.35.1788250084467;
        Tue, 01 Sep 2026 01:08:04 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:92e:7383:4a93 with SMTP id af79cd13be357-9391395ad22mr3407158185a.35.1788250083637;
        Tue, 01 Sep 2026 01:08:03 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:08:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:09 +0300
Subject: [PATCH v2 12/16] arm64: dts: qcom: x1-dell-thena: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-12-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=sBae8R0vKEkozIUJX0qR+welSBPJeruryo4FOGtusrs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloe2YyCfIsB3CCeMI9eWJndylkpFdq1LAvKG3
 +NzR45UhOWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHtgAKCRAbX0TJAJUV
 Vsx0EACaLuUIvGBBfPwkWTF32560exXX6swJSAr9zet2H1xusL+nPMZki3etHBe180T5JyJiLRS
 qkvDyA8EUuOptr/9PrOui0yTaqMB/oANSZDjDYniuM4kmaEbPgESqi1nZvSbmX7/MpXjb+5yiyE
 gRzJten1Pry6sifIutdlYOKj18yDwB0af/5LpDJsUPWZPPgKi3yGd2QMJ/aKKife7KnwfqvDeXF
 TMNfk+pBAP+kH53f8GdN0NiN7N2EckUxlQ7LQipuIPovVqiMOZgJMjwQqjqtbYezbzbs7LJ7xm2
 i5g7lHCuTbNNgtTS/fgcJmEuc3nY4SgUiLQRRhBVEN27ALR63nP+7/xkj3ehFIIpGcbFB1pb1ML
 bo281v3aDG5InERSeP+0xWSokpjnfjlk7KqmiCBJ+T7TdUagwj44MjdnRJPbVUkZQSXNVzTzNuZ
 6Nq7CX2sETXBkWKUqFSryJnazHGN1SliySUUacof+cmaBcj9gsm5AJykZtjlQQppMXrG5F8n9+A
 h3f+pTEfaA7eWmaTM7/9fhFZ/nTtBaYfh/RNMSJrVWysZGJGJjlR9d7yTZ7ePKh3ipOFe/O9DTh
 SdOcHIO2mH6tGuDcWvtuFEUZw4t233JV0iWUfLxtHcI4qx+CDo91s8ygmYHXeJG87ivGBL8qVXk
 leAEHfslB4H9iww==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: -wCfTkjGEdHQc7smz2xhZ_p3wsd8kAGw
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a9687e8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: -wCfTkjGEdHQc7smz2xhZ_p3wsd8kAGw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX3eY03FQUCWPp
 UoEK4IzMzvgnR1/T1Kk9D6tRXX7J4nj+oTkZ52AtT5bxqiiWz2tBnTmHlxFqlLIC47u1GAPd+uH
 8bW2Y/Lz9X2nU7y417ip99XI6sRNyZs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX2qjaFQTfFXYq
 W7mwJKrZIf2vMNDcpPjeLWOOtdc24RFS/0XpYG2zXArZul99Adll+QIeC1ZNOaK2iGrvtX/GyrK
 WJOs+udGd6hDpOxL0MHMp8JUwtZrdi6yoxCfruPxPj2nhbbKc2stFwYuOom3dslarQXL3CeLvWp
 r4avi9xytRreen+DSfjCgZceaEnIrt0qa69oCVArrdSyC6M1CI3tLyXDLufdxBihVym/6ygbFUM
 JzOWpyBYHkM47u9jsbh/5J7Py1pCqR2f6d3TqJbYyDmXuym2/KyJSQOgrHSSu137Fw69VWSsarG
 yHTCNFj/EsjRGw5YqmSpYkaeJu/O58SqzZYPLli5aBEtocgO4Y9uQavVd9sTBA81l4qGnR4gnI8
 GaJpwqqVmfo9kxj/XJiaItyW8QwgA03tRizIgwMtgjR0F85s9WAwpJIUfT4CtfIvRT6UDt52dQn
 wNwHOH28kW27jiftlig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index 4cda708455d8..b367eef085ae 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1303,6 +1303,7 @@ right_tweeter: speaker@0,1 {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
+			       <65 1>,  /* EC reset */
 			       <76 4>,  /* SPI19 (TZ Protected) */
 			       <80 2>,  /* I2C20 (Battery SMBus) */
 			       <238 1>; /* UFS Reset */

-- 
2.54.0

