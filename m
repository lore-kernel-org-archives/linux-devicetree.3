Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953550;
	b=DsTWoJk3RT9e2Ga1DzFaDF5IRm1kfhz1rFfRsum177v5ckKsY7CJsHa4FYkd685Kmj6K
	 uN2ZAWCyE5VuA9KxkS+wtPykL4W+nGF9KH5vMuaz05ReYtGcLG4K9MEkC3jk9nPfPqVWO
	 zA/nki5aWlcKnA8hVndoa39Enrvwo2es2EKQslE1BOEzm9zhzIJkEkvpEKrW/8ePTGGy/
	 IUbGZqTe8OeJQLp7rkmY7NGwt7//OLAbi0d2RSI1tJYgVFF5hrndL0B1f84itX4UEqIK3
	 NJ9vFuUQ7v1n4EwHbeA7dyNS/RqH+EHEHWmwj8KOTCwYZdK8Wp0zB1ao1X527idqKWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
	b=5iVCH+Wux0wKLCgPFofvTOLqpZPqgObiiX5bxNDedopPcLoQVHuDOPRSnu54WZIgHY45
	 GKmu/SJlgOy8JA+aCm6BNUILHP7X3qJuvVQezXoOqPFEdvQjxW9I3Z7W5k5obB7lHPsnP
	 qPzZ9V+lfUnkRM1H0pEZSTrqLNS04My/jRMLLhHONzCUyvtd3Kyhwy9dgQEghdZm93MpL
	 fUPfM2tbtK9SZDH9U0XSGQ+uYNRnD9CidEW53v5fVghOKZtT60aqIycjgXOsOXf8NJNBB
	 +iuZT2xIJZdzRI6HVZrEMNQY1IHvp+j6v1G8kVVYchHrdUO+Nnnh9Vz1SrgzL59xYkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mV4cBhnI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=is41yZcK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99419606A328
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99419606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mV4cBhnI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=is41yZcK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RTLR3284432
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 08:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JJCjzDhflBD
	eCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=; b=mV4cBhnI5f1bkIth55MkDV9fkvW
	GVKNJdR1cjKgXNLqy2Cto+za8lLqIqqeLBU83/iryod2JKUPtgmZhzPmjTWWZBwE
	G6nQADiLwDNtbFsSmMgD5tabzguqrcPkuyQBRIr5unVEgKLdOFb56/SlqwOU/p+A
	QA1LyLB/LhXUnpQU8PXaZ8KylyaZn+Ije0s4LaKLjl+aG0b3ORyAHHpoMnn9HO0N
	DoOch5cre74eBI0Vlzmn3vAqVCk4D/mCmsNmNUzXpeSF5UkQo0ozS19nnDppYduD
	oP8/o7EgnS2A6cl092FWDt3HC7JKsKIbbU31p/GdgIXpovLhqfue9nFT2Zg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1upm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 08:25:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f62934ef6so92034885a.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953544; x=1794558344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=is41yZcKlcVnkykHhVxctzLohW2pQrIZFY3onETvF5oT4mLbq7G1bqjqAwdL6mwTrE
         VohlwRoFYgxs16WLokF6tcgAmw2Mro3YqmK4TbSXUbjKWDxBSJE8lJ4T6T8CEvCmtw/l
         AcWj/KTlCp5uYuyHTRRpW4k9qYKXJVGLl/Uk5aGYHCtPJ2vM7DW7GJ16BIyoNYAX4TvR
         pHi791+Tz2DpBljxrbM8VZdwItsOAv0C6f5j1c2VMrEewPnAqn1Rxt25ycV9ew3+75ym
         BVNQYW1g8WSL4DNGzcAM4wm4UJUxTMpakhoaSH8tAsgZ8NeC5bjG7q1r7sImKCmNcvWG
         txlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953544; x=1794558344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=gbbk2PppviczOjvhGU+fmKvVk7TYRildVqkYUd1fzcUYH2mcqMfsev4tFZvpHI047S
         uWZSRdb1X5pjoh5gQfRej3Gh7SPP8/vbtuc4+80lBRtREWASCF0wzPp00ogSRQt0k94x
         xTF1cyJlIimC6fbPo7nEtes9dX/bEC3U9GovEcWIpUJhbx6tKu0+fjEPpm9/B2d26TP6
         aGwyWtSwRRXvrDeKiFbGZIU5Ublkm6Vv7Fxba4bMXQyJy6ft8qHy1gNxudsaaz8ojHOM
         PgebxeSdaiiMFNOVcnWSZmYauCo9od1yJ+XwZdbu0PP5ucnDlBxkKm/VPT2Xc1WmDAoV
         PVuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmq4iURkZInCUHFBjY9TGTsyh41hO/leNLJVJ9tVFXVoxWVKlRuVDQtckj0apvmJFu3I/sZ/jz18N3@vger.kernel.org
X-Gm-Message-State: APuU4Z/iuCkYAY71xvwYt8Fj0dJXArMhJcyb8VGe/jyZ2F6R5lr9aHCy
	Sa4K27WagAJOK7St3YCtW2AJrtJReoBPl8m6240VaP7ntnmWkzO7rmRm3mqnDtmraXhMiYGfH+I
	lwjPKtcE/g5/oByf6nKtJAHR2VBg2EbHxDE4C5qhG04rpaiqNiBihvT3Pj3d5ctWJ
X-Gm-Gg: AYBFou0o3I5+0ej1dtThWbZA9d6tbdgQQNjlq9DQs+MlCTZswUnIoXGH1ix+gsDs0LW
	xeOqZDeQvGHZgEPyNx6ubQ6NmpyH+f0ypN/uQ17498Kqp9z7tv7VEc32/TkL+c237knco2iBTMC
	4hPDjGHvSPXfyMY4szD8vbsOKqh1a8Fr6jk6qcdg2Who2KjvtLmaeWHEU9sfPaF9QInz5PFksAw
	EDualsWITzJ6f90x+ZIFJZaS6DsroADLmjXM0NeETeaZAF9/+lNMskNdGNqLWrjrgzllpcyTYGb
	tcVPsDZPBQSzoAc2OYuSNvPyigNbm793rRHFvHT8RvlXMDXZHVW3FSj5WbubWN9FQcpWaWoDHYe
	iQjvHNljJuESth14/q+XW7qapr2BYkjB9fNWjL5JeVt2DwNFnZD1yrBPEGI7/T3EwJkQZvtdLZw
	==
X-Received: by 2002:a05:620a:6c87:b0:945:f0ca:436a with SMTP id af79cd13be357-945f32ebe60mr248645285a.2.1793953544199;
        Fri, 06 Nov 2026 00:25:44 -0800 (PST)
X-Received: by 2002:a05:620a:6c87:b0:945:f0ca:436a with SMTP id af79cd13be357-945f32ebe60mr248643685a.2.1793953543833;
        Fri, 06 Nov 2026 00:25:43 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:42 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 8/8] arm64: dts: qcom: qcs6490-rb3gen2: Enable JPEG encoder
Date: Fri,  6 Nov 2026 10:25:22 +0200
Message-Id: <20261106082522.1448390-9-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: tyrMl3jkFgYx0ZmF-cWsfos68GqcqWx1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX3bCk9qlYr25P
 CRV+eeyF3flXx9ThIZOUBE89OQ8KPT56pNO/IW/zRHwVbuESywIf5l57TM5QtiAVHvtx1+h0Ngh
 AyBvCbqWWE50B7F1Sl9aOtXMHUPTEs8=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aed8f08 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ciSP3Gwtf2YLaD0V-lgA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX+rZ3u8I4ykKn
 hJKHOocGxIc1fGOOFl+tEdOT7mrWvV61sdG4zWMX7DkoEmVvoMdtUKQVhLsSKEZeGmDC0vDvpEJ
 9XMiWlC90jYPfg3XYfrt+RD2i19h4NM3l80xyFA+OSOdRCJid2xTI4fYxq6b+KgKqgToTNiU8lW
 3T0Fr2xG4GNF2BB8kjh1vo6SVvWdTBFZGzdXZK0MzM+WwfutU52RiQSSxF4YDHem+D3Yp4LWf4E
 TEP3ZW+jdUEjnNn9gAJbvfjFou+HvmAER04O/hZWmOzpZuaRryrvWCfm0WG4lNW/sP+OOi16JVJ
 O1WWz8Fk36wXvmJA9WuP8j4Sj59CJnFjHZpjFwJpisbs9+p6a9p8ZGJUa4Yqrgs02KnKWp78D8B
 HxofN4dRKTUpptbBpMpGDTbCgRN/qxfqXtd8CRh5A0nTKQVPBKAoeF5XgglNV7+HRWOElQB4kin
 yCttbSJ/fOl7f3Bm9Cg==
X-Proofpoint-ORIG-GUID: tyrMl3jkFgYx0ZmF-cWsfos68GqcqWx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Enable the JPEG encoder on the RB3 Gen2 board.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a216..b96214758ce13 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -789,6 +789,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&jpeg_enc {
+	status = "okay";
+};
+
 &lpass_va_macro {
 	status = "okay";
 };
-- 
2.34.1

