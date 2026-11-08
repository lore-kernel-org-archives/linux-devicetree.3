Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143946;
	b=IjVgV1BBx5g+5WCbIWJ4aaky4N21J+QKOMHz1sSWnRtKgK2/Bvv1oqiJnISogQZDzzb/
	 Krr6QvkON2I/e0IOrTzZbBKLcg/Tt8WJi5JkFhMAhWgX/Vmzs67a+xmSeQyRMHteugzfN
	 Y+/x29yd42p1a7YIbj+axUUJMDYRSIpo4h2kub5YIK/91PIwlD3obuFS8QkJvhwqDmmzK
	 mZqmp88WWIMyIoxHXb/KcP11fQqqUBUJlb5BkRZzCmoxDlM/BovEt/WiblLW980YRooKJ
	 oZbIiOgx55yT/+jEyHnzNJ+9EGeoGaxdywy8ZzgKrBM96wlZMzGAHMBrIoREPb8eeAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fkCARdSce3zQQOopd1LbuUPfMjM4xn/vBfRm72WuLrg=;
	b=gI9Xp/+7tpYB87C3Qh7ArRgRZmyF49ruqH3uLa0uHvjg3q8hlDj/9JwrDFIwOD7k9D8M
	 cJgbZ+NfATykFt3lFHLCRuE5PWoKYCHqf3zuziYya9Ew54D7R71JEvLijCO4qG3OHCfB/
	 btxK1f/RSve3zzFzMIytkHeWOXPWyasRtyxap0Q9BUbb8FcZuwvM/x9ctDqVxl6+7XsK1
	 gSeiROXJzg3j0/fHw7Bupe+7yrLuwlLEzPWKeNvqXgiiLVe4oJuQhi7FA7Fz3h7fYpmt7
	 afulb1Vsl8QhjLt7z7VURcr6SF6hB3G/nkQZ2jYv5Ba7u6O5on0TXNeKWVo81FVX8DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmmGnEW0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZseiJOZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E96C606D804
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 13:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E96C606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmmGnEW0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZseiJOZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AfnrU1199073
	for <devicetree@vger.kernel.org>; Sun, 8 Nov 2026 13:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkCARdSce3zQQOopd1LbuUPfMjM4xn/vBfRm72WuLrg=; b=NmmGnEW04tWw0qBI
	EJsLz5EFuuhZ3VpfFMGJEy2Fh+TEpjk5Shk6VAZoxSVrcyoNbkamFkwYKcYHIIvj
	YAXXqjAMZKr1L36YT7G4fcA6ZpdyefMzqLSLngEQqQptzeNjhJ8IPMspATXiiJDv
	hP2CxEprfTMBTpWDH9foSVmuHpPHVc7nJx0wpKra3E8Kkg8w84KYGqWk7suOiOup
	wg8bR2yB+e1QWA9N/99MltZnMIJf+hpL3oNKZaCJKuLMsbNR+AZwlFlTJUmQnBuQ
	qA9r4GwgYKw5LYYxAqkpX6oEVzJg/H2G5NibaCbZDVLGTADhN3G9uaUpY+gJsKv1
	9DJLcg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv732wjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:19:05 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so376999c88.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 05:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143945; x=1794748745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkCARdSce3zQQOopd1LbuUPfMjM4xn/vBfRm72WuLrg=;
        b=eZseiJOZA9qOTgPa+C8u50NSSFqxQhggWNqpgV+YzVWs0KIy/MY/Z+r8pTOFPghgJT
         f7B4vkB/X12/+afu064Dia/T5scaxKJ8m1DsUoKo6+ub5d4cjp99XwrjJk20yVn4dhEs
         DBkERD88wkrR4AotVLQTmplMKpoTHLVhDRdvl04WJxSqnM0qVOdenufQKdsizzZM3dDR
         uVQI4bY8bcNamLCg9rTqy0K9bp8IOrYGuvQIYMDXndMBfU0+cEqpfpnXluIipdQLOxNu
         dCmriuTZ9vDrturU+77vVvM9w5QTpX1mvpENQ2lkwNEOazdqtcneAFebBbPx/34il5Aj
         AZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143945; x=1794748745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkCARdSce3zQQOopd1LbuUPfMjM4xn/vBfRm72WuLrg=;
        b=oI0uVq8zqPJylN4p2iFlCYW5nuGbxho8w4ZtmYSq5S/zRmvEpjv/5QjwaVWn/SUYLw
         YCdPOOX3GxnWqCjzfO0lsgF/Kx2F8T/GF5o7kn3OeQnBji7lvJJPGcea+1MexuuvkZBY
         4NOq3gY9xP+8HNVo11W8KKpzCzA1c5hAfR3yGlxljucE+Pwotib+nQvaWLFiLgyLs54C
         I8yOe9dCRJZyar9/KPmx71ugwxHJUX9zxHv5lwhOTez1PbYmrTyZD/LOH+UmkMCx1uxf
         hH7CAVAycEih0X3emE4OFPYY+gvlUrbzp7NToWVp5vIEVt9R6S1W7gE3XjGhcVbtcxMU
         HpDg==
X-Forwarded-Encrypted: i=1; AL+hErFwjGo9Uo7X+RQdLPEiCPCy026i9NMzY0SaLkr+mWaK8mZQe0BPuE4sB7XC004J2vtcZu27IKNfYlcd@vger.kernel.org
X-Gm-Message-State: APuU4Z+OSsfRUazHra0kBNvzJtxaOctE+8ApX6/1vCsr1mhq7R4x2AeU
	mKDcjSCNkZaNOvo/2AZ/vATjvECqDKwdmQj6/+HFiInuYt6HEyq/6KRhf2JaSJArGOQAc2ICttw
	flj9wQhAChOs9LzFWYc+2sQoB1jUJ7xXZ3orIMFggJIrbWRJEEGuUkuy6CH3LrWkq
X-Gm-Gg: AYBFou0KK4SB6vBPMp15dFY8PeK/AM/CtD2fORiG2WpL0sff5IXmZpE/DzZRH4fe5i/
	qGfzHJsB889LZu0tYX7ebTjlzjmzyKLD9gh5eWs7+sf3UeuqPtklkrmShkmNBBiorwZ/HqP2ElD
	K38+LrVc8dbYwD8gPu+Csi4PZRAL9hIu39Ma0KdA1dsGn+cfiloAj6XlHpqPhIRxZbwRaBUcDLx
	/xDSyxcBdw4SA4NJyJLI8U4ZMOhWJHop3WWaGxn1OWVpuHhyQXtqRUPfszhup74JkRmtDBTiPVv
	/+MIek9CXOkViDahW1yC/mTCoGuBCLe2JJYBEk2D82sm6aZtprABClaejjScK3V7lJ0fDCaVALd
	Pw8ZAAYyPjgPeePRWgqo0OvAi0bBs4xLvcfyJXGW4Mam5/6T1e7s+JrH1UCUVKJ3Y76mEOEMgF2
	0jNaw=
X-Received: by 2002:a05:701b:2802:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b39feadb75mr2038273c88.23.1794143944691;
        Sun, 08 Nov 2026 05:19:04 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b39feadb75mr2038232c88.23.1794143943894;
        Sun, 08 Nov 2026 05:19:03 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:03 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:26 +0530
Subject: [PATCH v2 05/10] arm64: defconfig: Enable Qualcomm TSC driver
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
Message-Id: <20261108-tscss-v2-5-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfXzklO2UaewuIV
 N1B5EdftVNMFpZiNdPLIn7+3tDau2ugZJHEqnlgEgD6tsZlvFPrs+wIETWpcYtEQBPmoS37+UB+
 hjjA4O+QGZN70ALHPpOM6TarF++81jwmCMtg7EUn+K0FoBMM83MsFNSIaMlMK8iKknEyzdU1nw/
 9Gw9QNABzeCSli6EGlgMneOfwl7FFzAPJWHVtMsd7r+MKKsyQoVvV1nbeBwwER7hQSOb89BsTJ4
 hW4td8e5NvThfyK/ok5+H8f2GujCEr9b5C6fIJxI2V6jSciHvixTZivtXghl/7icf3wh6q+upO0
 U6UbqZc7STP/WxqZ8ynwnw6vc6MaS4KS3nIkepwb50H4VsHbaXS/JlKKdAAQ/9/PkQBDVXbuhdB
 /20ZMKxz7D66XtVAQTufKyF/fvlzbJ1VUF31BRTSC2ScAujhmDntqa5hwkIdBJqEseIoSMCoAWj
 Ann6Fm7TmasxXZ9x/+g==
X-Proofpoint-ORIG-GUID: 2Z-4DyWUfCPHaifJ_ZneSi1q45ton3Hc
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af076c9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwNPhHur-d9dQeroUnUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX4IwFxI/DQG83
 M23ChK63bmFitz+q0DV2cJoND+8SBZUA/ZCq4aWHt2EKB1UR12cwSAXVNnOyjkjUx2xg+8itFaE
 bxireA5cQlfjUS1eCqoR2Deh41PhfWg=
X-Proofpoint-GUID: 2Z-4DyWUfCPHaifJ_ZneSi1q45ton3Hc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Enable PTP_QCOM_TSC as a module to support the Timestamp Counter (TSC)
synchronization functionality on Qualcomm Lemans, Monaco and QDU1000
platforms.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..9af55787b236 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -689,6 +689,7 @@ CONFIG_SPI_SPIDEV=m
 CONFIG_SPMI=y
 CONFIG_SPMI_APPLE=m
 CONFIG_SPMI_MTK_PMIF=m
+CONFIG_PTP_QCOM_TSC=m
 CONFIG_PINCTRL_APPLE_GPIO=m
 CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y

-- 
2.34.1

