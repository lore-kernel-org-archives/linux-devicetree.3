Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458537;
	b=wo47otwByVT08O0m7QZAw89YPGsbgKTcxGyrjq208uKnd+0D5u7+lEco4TUno+Cr0TpL
	 pRRUJB2Yd2MdFifs8OUxOXU7jqbHs6r25sc+r/ABFZ2Swlm6jUB0BuqigpuAis0SYKegV
	 FzXDuQ3WtRmNvDwnvsMWIcomeBNFUIW+TvGMzvF+WC7NkV13xlbm6P4/vqBGVS4GVrgjc
	 cWjJZ9U4YQZv1ksIReHACZBbbpt8R33xACbIEw8TMIKAqpnQPoU81ONwUjAoMyXEvcssV
	 ryLa6Tbo0gzEfvm28VPABJyiqXJJbtgeB2LSOTpa5iKQR28olHK5r7qKx8HXDY4VC3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nhfcchwZrq5HVAFa+r5LC2cvCNyvuS6jjcv2doVhkDU=;
	b=m8T1vMLAVLW8UyXDAQihieS4vVd2rluGyfu+6+XUsC/mVQ0/3yvTJcRGcEtBOmKazeEw
	 Etl61V2K0eR5u94tg3nKxJPH9iaj6+21Vw6xsoqw9hLlHRgwqOHhgvBEi+mmYljoffnpB
	 LRy49xSe0ZLTgE1s8fkk1Wn65ooWJzWWJbNHkUUvnU1jH/47xLjHr7mEeMW/5VWCP7tVJ
	 K4MgUejS98USlTKHlvskJkv1UpsbvIh3eslUg9nrl1s7pCPk7pthMdKM0pT1StN3xW9BJ
	 6T1tQTB4uBYYEZYjSDCfmHTIka4OuKLqfFQ+t4+a066h9rFFP14xISga86IQ9YnIlQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M9BSbVdI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fK0KR2ha;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A073F606A336
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A073F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M9BSbVdI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fK0KR2ha
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGl5s3025298
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nhfcchwZrq5
	HVAFa+r5LC2cvCNyvuS6jjcv2doVhkDU=; b=M9BSbVdI1BAMdhptdNQDL4nVZz1
	rEjTTxVHCT5UZS1IIOs9jPja/Wot9/8SjIdyJuhZLgAWVvb+tVuWe38LOjR8+4s8
	LiKBvrfdpOvoVmv9sgREwPpttVAP9lEzuPLQNmnNU1lAN2BV+BfFMqNKlVOI6WMk
	dYDQb1z1EV1nW9jj0QGcfbWkydajRhwDmB6w4AES8WlaS10GqaA1yM1USBsHILog
	F1OtBUMeau5y19Jn11LA35R7XwbCc/v+dQCyattQZsIjK3YFWStkjZn8121fLEdV
	E8EaGNkR/EdtxUjqnFF+WaLuF28qadDHDxrHwKAMm8yHjzglgm2VDPRlB+w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pauye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso5048654eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458535; x=1796063335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhfcchwZrq5HVAFa+r5LC2cvCNyvuS6jjcv2doVhkDU=;
        b=fK0KR2haXbhjn09icUiF5k5tTPdJ+GtC7WJPAsIQcQ3vH6BbWYGdTTfAtnkA2F9qGd
         wNeidrgdPseOKYSouPW3sc+Yt7zjrlJmufbnOIPyMXKITvYPLF1pVZS+Yyqv8RyfpuLt
         bISwVR2gLFexPq2O28sq7gildWcryuFtXcSOh8eFVnxTL49GHvKc/bwZID3qzrJjKVfW
         Iu8xYGHGS5vS9DH4OHBpPtsWaNq3gL8Zbm4yM0ZXWTtMYGv+3kO90gwTtGx0zWbNqp/x
         ZrsIz+KqAnaNS21+iXpNunlzLRtjQ2bl9uJgB3Y5dvyfvmTOFMnpfpuOuHK4GnCpDSdh
         0Iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458535; x=1796063335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nhfcchwZrq5HVAFa+r5LC2cvCNyvuS6jjcv2doVhkDU=;
        b=hTYRkesSZMEiR8P677i9Nn4pn5pVLocAjSvRoxjwrZV//2CuGtqH4obpBImfkUDhJs
         74SWAX2847eD0fp2bWf+gCMcSI0FXetA67R+f8KDC4/I3QUeWYgVdiUzXflcAv9crU92
         jS8DUo5zyIBmAzv9b8Yf3h79rPCkX3S2vXKinTfaFNvQL1JX8awgWtWxF3pLOUUGwSLe
         6qtnL8RGdOzNnSrV0pNZHvudZjMnEcx/8h3gHsGCdFBUp8wLoSI8+kit6Y3u27wDDS20
         rNhwm2B3zORinn6IroMbXjzgYGamgtZEL0gsC7pMYI/mp6SuSPkSiwmKNUw1IRvKT/OW
         DcPA==
X-Forwarded-Encrypted: i=1; AL+hErFDVallgKL/NAmddcRaoQrkX38eaLaaiLd1x6Y7L1UnuP6hAFjB7KoLc2EQZjqimYc/r3WKc9LHJb1t@vger.kernel.org
X-Gm-Message-State: APuU4Z/39S/szzY3cW09kYVoyxyRU4vqhePQ0Pd/Xry5Zl93GmCSJudS
	ZwnmM+TMecVTBRYcv5rcLrReV5zLQBipa69fgKx4krcpScKHVmPLLU0pqADIzIxxqhLg5HHfCEv
	WLYT96w3aG3Q9C1lOp4YibWjAaiHt8MrVc5CGSwcqfqQx341azIiskmMsi+WMRfsQ
X-Gm-Gg: AZFdTZe4JbbFDg1aR3HF2Sn6lfvKg2e5GtvRWMK2UG7Gug4nW5e7rJawGeGxQyyFEpJ
	emHJS/0m+WeW1u9f2Tk0xk2Lgh2FlcnX+usYiDWcHVUR9AJgXiFYCdb4zv1GE+HLWNJeA6bMjwP
	Eft48iizM9rEKTBeZ+XenslMTOspsX5ErDz4546IxVjdadnhkHslez8UrCxluq/MLs+VHMgNKBr
	jH6g5Fh6UC1d6kb1S7sDZXdnwPWAKRbGltnSwWYfScCdbMDmxnEECParwIROvtJ0H98UDXX71dJ
	zlsneV4WqfWuprfSgjp29Yrxrc1+wfxyqzY55tFCzL0ol/EZeA8QhQ6zgeEZA1nkGTLBHeKoB7O
	O3FjqIR9EsBFwd20l35oHF9EXyRnMSgwdsMRhnK5L76a+SQzYzD34v6NwpTnp4F1PEIsVPNLGqT
	9Le97AR+qSn7sw4+r1N/FMJJFMQQ==
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-38571816d35mr12339159eec.40.1795458535448;
        Mon, 23 Nov 2026 10:28:55 -0800 (PST)
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-38571816d35mr12339143eec.40.1795458534987;
        Mon, 23 Nov 2026 10:28:54 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:54 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v10 5/7] usb: misc: qcom_eud: improve enable_store API
Date: Mon, 23 Nov 2026 10:28:45 -0800
Message-Id: <20261123182847.143892-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-GUID: Oc5S9EzODhSStRE1WI1J8IOD_nuOo78f
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b0485e8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfXzMNnsJ3GcwdN
 pC0I7k277bjN8wmhebjiJPTZNhyx2DZbgg0vgvuNIJ+i8uknVpqToGHNJ2CyThDRE+EfZ+lVDnL
 Je0YVXwtdVlldruMapyg/tWgI5dZeOI=
X-Proofpoint-ORIG-GUID: Oc5S9EzODhSStRE1WI1J8IOD_nuOo78f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX1PFnY9T47Hla
 mzZnkTTF29gbrTeYw5aVQ/zJpzXWLqGJuE/xgVmXm7KsSkYhz1sHxs3bDR40AyyFIMlXF/VUyLG
 Xj6Ki6PTAiME/LV2AUfjCJiikq3qB/YZJJ5pautrfcsyn7jHw2n1Ip92GYUnxVYDa1sINkfwvq8
 /T8KoigmLfPbqLYCujYz/ajIX4i0mh6gJ4mOh59KArEbtfaOEJgfMCHuDOXNKD2ieVRxVJbzc4Q
 2trZG7PwzTY8Kc9X+WwTLUQftY2eLtG/iOOByb3+q/6HyKw3/plFRqVV1JwBy1528VAQyyqtMkN
 JDzCieliQQV2oJHc/yi1bsXr20JlyTmEwBAPKGVPzKwgwJBCx8PyuL9MEKM6jCUL3mb1eEFwkIj
 tjTdUObSmIvCZZ/eiRRO5/YgvgU5UDLhp2CcZykdGFvwLGAxVZov/KBhVwLr+R8Yv+HuDk3qHij
 G0Gus5XdAdjyIdF2beQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230073

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 2304402fc90d..9f26231b6648 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -164,18 +164,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1

