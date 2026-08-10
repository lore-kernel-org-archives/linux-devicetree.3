Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A02540A952
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376550; cv=none; b=qC68kmyluIC9cOCn8fOoucmHTcKC4iumHes5LgKD0ThW3UvpQOKqhs6FUnN6o4g5KmSQg6P0OGJVL8ohUpcpykx0h9GdzJWJdANypnq+VHc/pqwOxveBAY9ZRkRS/UQFFpp4ZZQU+CJKfLUSMXBayR/HU1udP4Si4mqmZPQEaYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376550; c=relaxed/simple;
	bh=KOQNNO81+830lW+Q5k5LUwxKxi+2T+vtgXBl8cZSLfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAkreJAtch8XrCFE0/Z/t0po9jav9LClPKPRcSdN2gQvqu6p6g3A+p9z40Ac/npq78wIjeuq1gGrPZzHOoiVk02874NYcm701cBsSihRdPnShW9bbqkNQ1BWEy8E6jeIXKoo/6Zwi9xadM16nj1/jz4pdrFk+d/5Kl3/ZP+HbnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxdmszqn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9mgvsxs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxdmszqn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9mgvsxs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWMFl2057365
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VwWUHl7i5SxMpjZvZ8DdyGzjAdldYolgun/dp8YjJTM=; b=jxdmszqn7wOWgM4g
	BQIxMCEhb7VA4IFBuq8zWvTYwal3EbxIy/TY5wi9PbaOaFD1LL+aH97yZQ7HvRI9
	K26RBeI/XFAlm6QmUZU0OsNQ6QV5rCutbp/nt7TkwZCpgbg9+BAcxfN8M4pSEQgx
	IwaQarj+/eWbFERrk8p7OKo1JOdPLkIGAd5uBlAXoqTjybvAXITMGVGG1AHSXLLb
	NYpTv/JCbDXfMIlGe8OL+AofhJ5H1jwNd28tyyrlGH9odQjNmWPuMTuz/F8oTrKy
	pcQ9IuPXo2pcRVkOeXjJFikBf1YOZK+XbYtt/rjtZvyzSefQ0RqUcHsUW8MXPtDk
	GujWBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v2acsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d28f8737eso39544471cf.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376546; x=1786981346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwWUHl7i5SxMpjZvZ8DdyGzjAdldYolgun/dp8YjJTM=;
        b=j9mgvsxsu4ySRN0CuyL2zQIg5Fk2Uvkd9lFYSq7Fy8s6pi0QzY5z1+W4Jod/EC1vuC
         fsEKyy5iyKG7uBLOqKa4m8UDe2ndvsBKLgjNgA/JZD0pVVJ9ayT80BMrpXlGXUVVRM/l
         stHPRdnqEm2L1wqFeF4c6AXxOAe8Bo0yyiD3Zy7ZER00nKXvusyVYR8xzDaNchBQi8jK
         rgFb44OvTOZHa11yzXqcB7w8+vSONo+Z7T99UWDidQcCqx1gRNvT5hOTbpR0CBld1kR2
         Og20TRSXdBF4SpiCaD4AthIczO+fCrvSipwL/KZcbS274neJ5OndIcyq8r0sDi47f894
         zVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376546; x=1786981346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwWUHl7i5SxMpjZvZ8DdyGzjAdldYolgun/dp8YjJTM=;
        b=BEkt9EK6UF/q/p+qHuiyy8ZXzZCbHFAfqwIVYacfL6tiK+UqKjkOcWvy+3+3bWHw7u
         qL0xWXT4B/M3mMPW55OATaR0DThXIWtX9BGc594cs8AyafCp+Hcw7Y9K1p8x1KpaKi5f
         tqbDAB+2mf1HSZwFKyyo5K/oe9Mdzhj058XbcbmSr5g0yTkylCWSnEEiwTlAZSaZ8jqp
         jiOsdrXt02r9Eb4WuYsLzL+2RLkJVsUK6/U+R0Tgc2tDsBiXok45rYKL5lE7UcNTix/Z
         IRGsVtnNdDzqgPgOvbTPttuPoeo2AES/F1ipJ+0kffsYocTJwPBXjy71ICVCoBUB60Ao
         5dbQ==
X-Forwarded-Encrypted: i=1; AHgh+RoK4FBMvETSviVZcFteCX1fevODbr0cD93VqMfoLBX9sT/b/luvqLgQDRQ4qr22oGXIfwwaQT3bs7le@vger.kernel.org
X-Gm-Message-State: AOJu0YwVRlql/VNX0JfmgvB2Z77GRjHLEKEK5k2Bo8iD/H2aUKn0teXA
	NtGcHNxgeHc6kTcGy7zTuB/4p4xyg4uBbJg/jmAPdBiKYK9+MzbJSymwvVbX70cYgxKnp6Mqnpn
	ty4toqvHj5M3YdQGlc4OEnF0dDo8dlKXm06rHGSgm0CofiYfI1T4lv4qcxARKrZDb
X-Gm-Gg: AR+sD12dyzP+9MSu9CfygWKPqARL35Pe2OyOV5z+S07xLf5IxxLHOS0m2GD3CfMOiKe
	Pp26OkxY2bwb/D/pza5hawx0unWaf7Lxgf0hABPm1S9sl25N38BMqNRydNT30pVCOfAsixf+fXu
	sNbGFSVueTcBB+c27Bqqn24KbJDh0U8WcBBQ+RPmLjrKjcgId0lU/8fKeNi4avdSSmpXmpodCjr
	pQUvaBv+3GpOuCQfbJdUGKBjkffSnah4FWX12GDpbf3hKCtLabnyVVvhXjtVBMjvfnihPUrioLw
	jZGcm4MQCaJNEPMZIJYdYTqV93GLjUGpqWrqVtIzT3F0+L47Yq7PTZRVKMC0RGpig+fJZKMTYT2
	WRIGIPTzxa5UV5OIkjuSVr6dXEz6t+Mi3PMkZebNc0qgiWAjBEYrNLRburfhvVTSufICz90K1YE
	4a38ZnWwG7cTnKpA==
X-Received: by 2002:a05:622a:1e14:b0:51c:d52:6049 with SMTP id d75a77b69052e-52d20a10f1amr262582681cf.28.1786376546346;
        Mon, 10 Aug 2026 08:42:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1e14:b0:51c:d52:6049 with SMTP id d75a77b69052e-52d20a10f1amr262581891cf.28.1786376545891;
        Mon, 10 Aug 2026 08:42:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:11 +0300
Subject: [PATCH 07/10] usb: chipidea: msm: do not force the TX FIFO idle on
 HSIC instances
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-7-e5f93ea76ffa@oss.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KOQNNO81+830lW+Q5k5LUwxKxi+2T+vtgXBl8cZSLfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFREDbAEKMO2A2Qs9sERI3xq59bkDCER9uEc
 7ajvN/A67+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUQAKCRCLPIo+Aiko
 1cMKCACItVH4hSeLJfpkqgtM3Mn+A0oSAX0xdpecK5aC/leaBuzd+gGevn7S9wcw4VTojJH0NY9
 dlDqP/dudfyiT5l7h3bhhYGIq/UmrMHFXjWHdY2u62V1hYgendPYLbXSSpPAeOKKKE2p/amEH6M
 uVck/ccgyD2q4xOK2AXuzcyH5Zm9vobVl0taSLfCTB7wvYltD46LNhXdMLePE9DFsID4VJLdFbh
 9Wth5gRpr2OSRCyTDtM9tzLupcOH33DHNSyCImYJuWTGYg9LnDODCk1HKcyN8/XMFFdlWX5hJcL
 hugegT0rjwOPAlYMZpozWbu4BwtyYPhlag1ogWOEb1BpZdyC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a79f163 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Nuiyuvcmx6Gf9mYuf-0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: OWSf2UYTHuion6UbDzK6NycN3W2eRA7A
X-Proofpoint-GUID: OWSf2UYTHuion6UbDzK6NycN3W2eRA7A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX/ik8hR+JLCFT
 qXMsMaNQ+aW+YvabUQn7L6n7knCdON9wYMN/tMeaGH1T7om8pLPLorZaxDMLCZ9cVhhVZH0r4Ee
 4GlA+q7/+sJxDv/UpKLtIE0BDhEfkwu01DXIl8rrHPwvJ9g4weRof/Rxi35n90/slr6JEPHoOei
 zh0nr2dRRmMLdito+URT7pQ4mpoJbw+Z5YSWQ4FOKWfo+YYFEULRJ+jBorgMRE0Jhj2X+WYWNjH
 xWd1jsImnQ2GNiaw+n3+Dm+a0VZ3uNEVKDW1RKHkav42KIWzwx5DB2sNPbobrkbuYVuACS5+4H/
 t76O2c/1Fd4TKCqNaYe7HAJ0S6hz5QJ5f8Q50cIQx44jnixXVlIGFWgBqh/dyYbaykU+UG1isQN
 xKhaZ3ACPq2geAlqxCUp2bSK2Dw4nETh8OOQxNvpj9YK0M1rzBNaeIo/24jqJtOb2oasR6ul0Fg
 OHrkCueEAV0yM+HubSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX6CoC5OH14s3x
 QEygFLOssoYPgTq4gXRlNaMubZygb4ZgM6T3DurxGSgEGiMjct+Ju6pYWiVDGrvuub/aqrsRe+k
 Em4DfpH85ea8oYu8kWJ+sBy9NZ2j/wU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

The controller reset handler unconditionally clears
GENCONFIG[TXFIFO_IDLE_FORCE_DIS] as a workaround for an RX buffer
collision issue. The vendor HSIC host driver never applies this
workaround on the HSIC instances and leaves the bit at its power-on
default (set), so clearing it makes the HSIC instance diverge from the
known-working configuration.

Skip the workaround for HSIC instances, like the neighbouring
GENCONFIG_2 write already does.

Fixes: 47654a162081 ("usb: chipidea: msm: Restore wrapper settings after reset")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/chipidea/ci_hdrc_msm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
index 9a9410a814e5..69be194f8e27 100644
--- a/drivers/usb/chipidea/ci_hdrc_msm.c
+++ b/drivers/usb/chipidea/ci_hdrc_msm.c
@@ -108,8 +108,9 @@ static int ci_hdrc_msm_notify_event(struct ci_hdrc *ci, unsigned event)
 		hw_write_id_reg(ci, HS_PHY_AHB_MODE, 0xffffffff, 0x8);
 
 		/* workaround for rx buffer collision issue */
-		hw_write_id_reg(ci, HS_PHY_GENCONFIG,
-				HS_PHY_TXFIFO_IDLE_FORCE_DIS, 0);
+		if (!msm_ci->hsic)
+			hw_write_id_reg(ci, HS_PHY_GENCONFIG,
+					HS_PHY_TXFIFO_IDLE_FORCE_DIS, 0);
 
 		if (!msm_ci->hsic)
 			hw_write_id_reg(ci, HS_PHY_GENCONFIG_2,

-- 
2.47.3

