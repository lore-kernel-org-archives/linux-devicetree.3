Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402EF43BDD2
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803163; cv=none; b=Hm3fjWP+7JL5u6LBL4+LYxCBAZ4y9naTqAws91q86xVTYv71idp/WTrUbwaw2U6WQFBeWFf9K/hTn3z8CZEMzC7zSFjR9RLgEc/xAi8z9OUluqT4UeyjmPXUeCfTOExmfvsup9jr2A1P5XN+9T6R0Oo6YKpNIqFuSIRU6rZxXkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803163; c=relaxed/simple;
	bh=PBlvVsvGr+bykm8WnMhzex1smC5AH7JlTemQnJwn/hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CVSNRzQiuV78Owl8Qs8Fc6FA05hzt9O+zWF3LPlfQ7ccLR1X2txAHSZWFp4mTqpj958jPB3kSXT04/HL8UNcjkSDIOn3opVpEqA7mUSdPEPji74rwTTDXe1w+rNtL4Spe9BRXB1fHno7qijHhSwDsr7PqpyaTK2SofUkkZYOcCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HM2K9ao6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVyuGNHG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HM2K9ao6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVyuGNHG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qiY53387993
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0xuxwwHnpi9Fid00zPXEaRRM79uQz6jYd7duTu4iLeQ=; b=HM2K9ao6bh5VGGEw
	klLAt9olwBvQUG+TOCJHccBRhVHgCbhQnwHkPXDhR9FnGs1qxFJqGLCxqa+7ZN9v
	PA1e4/p5LwWJE9thRYuyR6AMTlQbc2JyWKjVz6uGF5Kg/ccTsIMGv+7APxnV/REt
	dcVqLuCmJnzYcZuj9unOolcsy8rEmwyqkBZTZVfZsUiLi6EBrgozpwcWqfegly+I
	hSJ+OZTipjQNqq4UhrpPWezMcT/vs4d/AD5X4hIsWmKgcHdfQZ8hWBVMo/Po0BMu
	ZDw+xd0AmCpjDRapFpCJSWn+O4GXA8YtSNunkw1NaOurayYOsPS70MM8GyCQPsxi
	AyL07g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275knkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:39:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485d853b08so1329879b3a.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784803160; x=1785407960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xuxwwHnpi9Fid00zPXEaRRM79uQz6jYd7duTu4iLeQ=;
        b=KVyuGNHG9xpdNQ99VAXlmru4ElxZsCHjRXLQ1Q4vi8fUQ3AaO5s52MEMAEy6i5vq6s
         mzKBryOaxyBSeNo61tJxFWxXM/7Qbgnj1/x/138zZBcss1O/VXwYUojw4HV7CAa3SPh2
         xEqrHTPI5b6iMrHbI00Yz5TDLquCzkikYtC9q+2sMgPkEn9lsVBFmjqN+4bFeJ1PlHPQ
         lyuJkMrEmDCa5SuDMm/wRHiBmt73jjFKx4Xfgjcmqklwfoarq0pwmgOtDlfeItleLepc
         8s4YGGQdKuflG0lnet8aHl5Oc/EkvX+7dJrTTEJM/B3SCqRmE8ojlytVkY2UoJiaTugK
         1RyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803160; x=1785407960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xuxwwHnpi9Fid00zPXEaRRM79uQz6jYd7duTu4iLeQ=;
        b=sORfn52zmIdGCTt5cDrOJFZNSGjWOTfoD5fuwH43jHrnXpf+sexV33azf5EHQw0Jr6
         qyI2FYVexxoyWtczvLsfi361s3+syZDthifZdKkN4/bO3F5/OdngBmqoOVRLkIT/JdPL
         gUJC8+8sBVOUsI8JwwcSAufqMmvn4Fb+UXJdI6x+itDqelyabVYa6jDRuifWa3fgwSyY
         DG2gl9j5ntJURIoQLY37Wd0qyPdTWLGiBsk8UL8qtbzuoYsFdzT/lJvojAgSi8xeqJ2R
         hwFKzGTIa13VtBNfxP/18ODqXXF0qEzearOvpA3s44RQDJPDrumqzD9cqZsvbxVj9qsf
         lz1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqR1rYsJstnK8HvloejjSd86nja5jegHJag7uzchImocU6SKa5P4j+1rKgz8ldhR78IZSGXHBdEcsn1@vger.kernel.org
X-Gm-Message-State: AOJu0YyTKibGVhxi7gfDzZ88ggNYAjY63uBEM6KL7UqNv03iruMCIYA2
	vMz7BsjiAjDVVoAhXDgsmQC24+rHjTSaqpsJqhLyg3/s1bEzvxCw08z0GhieqSX/ifbg12WJ7PN
	vhAjNXTqzNVi70yro2amPBSm1LKC2fmwILsijiTS4yM4uSVg6f70ESOItnMkZV8HIberkzQz/
X-Gm-Gg: AR+sD10F+AhkdoiyWLvgAxPp8XH5uUqWNAo/olw+P4vJmCykUprH9EIAUulC83zj69G
	BIpEOXO60DwBMXTcE9pIh/szrHu1GKQRM0JXMaO7h+GdknaE2BoiE6cQ8DSrxL/BMQUT/jkg7Wn
	TBFx3JnYlrD+k3NsEQThelULoNvYxC/Ae6D7h8oK2m5mN5H4+RH7W/H00JUNYOP9Z73t1f6GBXU
	nOsHwe8MZP7fcomRisiAAsyn8lR9BjECGn25ZeAjli1CdaX9/mRQhKi+wAs6/VsJkqmBlRNHfyG
	WYbp6Fcf/hc6vGL2+1Q96lkyhvboKxuoF+f43ZhZhUV8jg9AlN5Mzu6NlG9t6iPtjiHeQaGFVfG
	OOMurqimWvH2aHHZchS8mylav5MawDRnCwUjcdkh/dzNraDQ520E8ochLW7SZk/KAyXKwgg==
X-Received: by 2002:a05:6a00:3305:b0:84e:165:da65 with SMTP id d2e1a72fcca58-84e2c244122mr2705013b3a.64.1784803160526;
        Thu, 23 Jul 2026 03:39:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:3305:b0:84e:165:da65 with SMTP id d2e1a72fcca58-84e2c244122mr2704979b3a.64.1784803160120;
        Thu, 23 Jul 2026 03:39:20 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17604a46sm2864469b3a.60.2026.07.23.03.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:39:18 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:09:04 +0530
Subject: [PATCH v5 1/5] dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-eusb2-int-handling-v5-v5-1-f32ea6c1a318@oss.qualcomm.com>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784803149; l=584;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=PBlvVsvGr+bykm8WnMhzex1smC5AH7JlTemQnJwn/hU=;
 b=Ig+LtmVTjlW6psaSiwo9MZgmFk6Unrs5ipwJbEhMmqnVTfmBdsIEdjhAECedPrDJ4SusZa3CS
 JCHXuEPmk1WDAs28elvozcRyYLraE+9PDQVsje9UcyL7GuDG9dDcfyi
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a61ef59 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1husMANfLlrnribazw8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfXwWkI1dRdQsG7
 nJUzwZXVDpNC/obLnLE881fWGh26mqS1yA7FGMiDGqfu+9DkDvoJC97/vBdNeacfSCHp4mpSssl
 Qb+fZO9CtUAX9psO3Cik5bz659snN2E=
X-Proofpoint-GUID: TAydt7kap5poN5Aa7i7hSDDlc3sZe3jZ
X-Proofpoint-ORIG-GUID: TAydt7kap5poN5Aa7i7hSDDlc3sZe3jZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfXwcmi3Ao+qsBP
 3FK646N2s/T8cmc9U+Uj2gtQtkUTZ61y6WE/qIYq3DBN1TeOUulC2C0XuV+dfzByop7tB+6IvDt
 KO/Wf+top0FCKFajAhe7TBs71r4BQpo42yQa5vSFgt5itjdfc6bk/DLYSQCY8DaUt7zu8eq6rbH
 oWHe8cahBUOmDFePtUgPGZO9/ueMjgeXnnbv1TWMU42jI4h7Wnk46DI3aFux8/zhHp0Jf15LXbf
 lwjkODleFTfDDONNyHdVZNvDGgagDvp4SE90vDDHUnVVicVRzChTk6VsP4KT01Qg96ULF+UblBK
 d6RYHmFyc3WV24zZh6ym+EFODInCm2weMWmpCAZat7E4zXJ50HQWDM0+SxRf4SiC76TpBIyACky
 kvPjG+e4Y0pR9SIeA4X+fkKYxrSG8n2yDmUPYSgQTd9APNuX9YlOnZXQSOv48YXHu0rNYP+RYfC
 LSIJKFziT8cCu1jYxvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230104

Add definition for EUSB2 phy type.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 include/dt-bindings/phy/phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..555a022c8c0b 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -24,6 +24,7 @@
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
 #define PHY_TYPE_XAUI		13
+#define PHY_TYPE_EUSB2		14
 
 #define PHY_POL_NORMAL		0
 #define PHY_POL_INVERT		1

-- 
2.34.1

