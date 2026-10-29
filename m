Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264488;
	b=kdRZNo7i/sr3o5Nv3LilV7u3nZaUe7sJ82vtbHwiXkb01RTQK2xyK0aQMB/dpiZ+/kYQ
	 FtWxUBFPDdMM6dqMUZp5mFhqk58rsl8wzhWdr4X+wFnSHDxzlUrDEg1AMbuzI2hg3t2F1
	 T5H45P/fH7FL05lFMaHUIJcAhHq8bSTzCd4wMOd6mE5QPM6XtFn5EfCGIAh61w/wCW7Oy
	 EnXC8S9C/dU25MnaZBbUmDtVnpm7JLQ7cYvESMshqmvX1wO6KaDsfNh/FI5QgCUSNtVmN
	 CbBJd831x73jDe7UZkPYd6QCf17tFRehU5xcBm1gSzSxAMtPYXQXwcu37zlUbK8IL7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=;
	b=kZzPm3b9WZ722U5QjD4k8nM2YB7nPFilBPWnQfiu8CHEy1MJP6KCxuuUIKkdNz0hhXwH
	 aVPMUmavmIPwk9BB0qz0xzC8qFUKMK1pVO2WcnEcEnp0beO0CP65Z2ysMkrnjm4DHoSRE
	 bwChzET2KBXrzD82aMVAUK2SnQ3OBzAmXEadj+uI1Q4JyftvOb/pGcihI/0b2wA/savIw
	 +uMZNFwtQEUfGvKPTbdwp53oLI+6t7+pvDPe2KGsEo1sAfqQ/GLwMtlaX2FtTkgKmxRr0
	 OIv81phvDW5ReaieP5MxokLtIBECHkN6n/7zxSIZTWFzw6cK/EvL5EHadDblALoxO9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+ubSU34;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QV6od4/5";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB174606A325
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB174606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+ubSU34;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QV6od4/5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vARw659664
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=; b=B+ubSU34TnQmuqRf
	jUXoP6JgBr03nskbsZWwAdWWZq9rE9HnL8IdPQhFieB8jO4nLxj+z3SjdEgYg3rf
	Zbm/1TlJN38AuDcQ3nG+SdmrdvFDUoS/hdtYMU1JUihyMbbKiC8c4vv0CSgezLeK
	OVSHeDstB7ytpTB/VuklL9JHWoA+xCa5faXM0NPaync6ur05YARM1rEda8628Y5y
	TWxy9ZWMNt3mSngWoe8goa8ZSBazScNs5XetO7eSCCjyY3u4aePg5IKH5Rnr58p/
	gAIdrrcCHKAyVEDmM4sx3hnlxzVsK4rFK67J4g4uQuHbRJ/fMq+1aEJho4A3ZNKC
	uDHmnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehut48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:01:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8ba4757baso16308905ad.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 02:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264481; x=1793869281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=;
        b=QV6od4/5vrMieBEculNjxyM61sQpSXO78rjIMMai77uwErtyaacHznpWifG85Cu0bN
         FJuyaHnVHpaZ9OC0X5fPRncZlZ3HXUlxHUxNkbEWoiIrizYt678ZvNxaQ5ycaUdfSQyo
         Ki3Wc//wquNNxQ5smQTxdtwo/izOsnJhxDe0SjSwVgs01900ZQ5CSr30C2M2Evenf7/F
         gJ+wWwBVlt+Pexd/5hL+bFxTYqngMGuZTqlOLA4lYBIx7vhL61Fz46eaE5+YRGvfXs63
         xrIdPInxcjH7Q25UO9xR8MHAdyF91LS/jzR/pLl1iqKJRuPp+l447XOyZQqJzSN2tpod
         KbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264481; x=1793869281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+ql9HRxwiF7Hsvr+2veecKSO1rWsvRUfuJvm2uvKQo=;
        b=m6CSWKdqbX3qce35ybaQTPxH06A+3GoCTz1ONa/YIPnbq4WyOCSTX8mh4evOszWuka
         nQb1qJB8A2Uh6r0LsUHaRRWOwot0AYWzomgSm1QcBw51J/mdoz8/JVsT3NzSY3nq5O0T
         cZ6xDOEvv3rxO73bEzFczu6MPZjYE4Jktp6mlefDZXLzDGOt6WuUZ6La27kzEYj+k+Wn
         IF6xYCtVt8KTXnXcxiUfMeiOJi4iIs3p8vn0lqRiOqhabI/wjEk3hpewz+4kIAEyPdLf
         HJLFKVAGlaaiTj/FH4i+/+D8AVWIgHLQQgCUS5JLD1h+P8fOe+K5t0hqmpwcHY5CaqNy
         iH9g==
X-Forwarded-Encrypted: i=1; AKwUvBznLogQC5BxTPdTF/Itl+k+gbhBbQ4EZctQnqITs0lbKN6qQiQrMLOiJghFDR+24Mf0pPicPvf/+kgb@vger.kernel.org
X-Gm-Message-State: AFq9FYJx2TbE+qiuXL301L6IErbIKXSCV7/HR379Na7pMA+mxezfuzY3
	9cEwH7ATKB27sMIlefZUcjkKUCC8IPWaRZXbfjGqkf3MxiPr6UsXHzQfbeq15WAgKicc62INQho
	NkHCyp7CbTOmRJ6/UAUsYMhet2Zcx8bqz+KvxQ/RtmS9GBmIND5EywAcx33BTD20D
X-Gm-Gg: AYBFou3RLwMTc7dwKvW3LxiL3wUY3ZxqxzGy9F/AYF+RQqxmC8fW7r3as2lI9bUY+35
	8u5igdjI76xYDbQUoHKIgKHCnymx8o2fXxz2Rf8fG6Vo9YC/WzJrKseTzdYd/UZZkb9VrKZ+8ST
	5LdZqG/VhTv+cHfKduGIArXuv5HlLqtghPgSR5Hlp6/seZ9bu1pTub3euFIrOU+a4Le6ARzYFO6
	H2T0EAkaOv6U3Dj60ydyUBKL/WojAuaXnNp2p60HoLrBXtRwIMOTGOp7JLNpJxzeTeANm2Y0nRh
	BtWDUpUikkqN0810hr2jAs/AMMFA3q9BzAbmNAHXihXrmJsZ5xfnDZy+XtsBJyMFtfNABUDyyDE
	Bd9GfAQKVEfvRdLyKtmXhU0Pjv1BXSD6Ag461MPNWvKOhywfnzUbqHluvrhtbFrHGyjuyCsCFQY
	EhBNdJbfiM
X-Received: by 2002:a17:90a:c886:b0:3ac:9e76:aa9b with SMTP id 98e67ed59e1d1-3ae57e2b795mr3492870a91.7.1793264481336;
        Thu, 29 Oct 2026 02:01:21 -0700 (PDT)
X-Received: by 2002:a17:90a:c886:b0:3ac:9e76:aa9b with SMTP id 98e67ed59e1d1-3ae57e2b795mr3492841a91.7.1793264480794;
        Thu, 29 Oct 2026 02:01:20 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:01:20 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:30:55 +0530
Subject: [PATCH v27 01/10] power: reset: reboot-mode: Support up to 3 magic
 values per mode
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
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-1-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264458; l=4572;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3jZJCDBmdKair7R/qKaAWXxKmatvkMOd5u4ong8jp54=;
 b=pwt0UJhchuo9nRGpdPR4BB+yIn09z57FaxDRxlb2ix4AAxBac4tXKc6+sgbl7Lmrp1t16D/Mb
 l1rXyaHrrKtDBUIJR68JnHgXfn60pn9DJIDCO7wBnMbX2W5pYeUyOhd
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-ORIG-GUID: aod5P-FQjC1kEWDKkOerbDORj3b41-j7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX0NFH8V3Dn5FW
 4zYGPjMvHSGcQHhzHqFwkTzDyI/mhACvJbNC0ryD0xha1dI6FWulXXnx4Lsc8/l2bKfiAd7xWcp
 rZWJoNiF1TdffHmhnZWFv0ECNFIolwot6+kKbuEqgfrWxtQy51ooaLkN0Q/jRtbqgT7fgq+ASmO
 8cknX82dCtvewTex7HPCC+tA77NOIM+nIYqEDSQDlcWvLhJyy0SoocOUbNaUHj/M306xV2BdI7Q
 CueXRoBvaLJIoLD8aqLBNRbNDtLPdd8xKGthB9CmmWKP76+E0Eo5qX4zFZ8EkoTvQgMbagmhreZ
 JV00fTB9U+6+eCuGUIWAWPNacKu7mX8/OKKOwg2dYDqy2SJWOzl0MzNYSDFtEL5gVOe5yNqfGHG
 OOC3EpUprbBUe+wrBAHVVMlW4NtPXYlVRTnmSoWVhaAwOy/NIHx/Ny6DVhc/+7U8UXBssz7kl2S
 /TSQT1OPMuJ5waUMmjg==
X-Proofpoint-GUID: aod5P-FQjC1kEWDKkOerbDORj3b41-j7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXzsUe4YSTxVSH
 yLwo4QRWiadg5yXym0t1nvdPwpweabIzNNtKjPvE8G66LSNZnYnfBctoRB5Ho30iJEQ/Akf3pqb
 OEMoaySsZDFBpFeyhpf4ZNkGutLO6+I=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae30b67 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_usNffLPL2KliZ4tEdwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
cookie as arguments. This cannot be implemented via the reboot-mode
framework, which supports a single 32-bit argument as magic value.

Extend the reboot-mode framework to support up to three 32-bit arguments
as magic, per reboot-mode.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 46 +++++++++++++++++++++++++++------------
 include/linux/reboot-mode.h       |  3 +++
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 3611bed341e1..328fa37598df 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -20,7 +20,8 @@
 
 struct mode_info {
 	const char *mode;
-	u32 magic;
+	u32 magic[3];
+	u32 count;
 	struct list_head list;
 };
 
@@ -72,8 +73,7 @@ static const struct class reboot_mode_class = {
 	.dev_groups = reboot_mode_groups,
 };
 
-static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
-					  const char *cmd)
+static struct mode_info *get_reboot_mode_info(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
 	struct mode_info *info;
@@ -84,11 +84,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
 	list_for_each_entry(info, &reboot->head, list)
 		if (!strcmp(info->mode, cmd))
-			return info->magic;
+			return info;
 
 	/* try to match again, replacing characters impossible in DT */
 	if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
-		return 0;
+		return NULL;
 
 	strreplace(cmd_, ' ', '-');
 	strreplace(cmd_, ',', '-');
@@ -96,21 +96,25 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 
 	list_for_each_entry(info, &reboot->head, list)
 		if (!strcmp(info->mode, cmd_))
-			return info->magic;
+			return info;
 
-	return 0;
+	return NULL;
 }
 
 static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	struct mode_info *info;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
-	magic = get_reboot_mode_magic(reboot, cmd);
-	if (magic)
-		reboot->write(reboot, magic);
+	info = get_reboot_mode_info(reboot, cmd);
+	if (info && info->count) {
+		if (reboot->write_array)
+			reboot->write_array(reboot, info->magic, info->count);
+		else if (reboot->write && info->magic[0])
+			reboot->write(reboot, info->magic[0]);
+	}
 
 	return NOTIFY_DONE;
 }
@@ -173,16 +177,22 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
-	u32 magic;
+	u32 magic[3];
+	int count;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
+		memset(magic, 0, sizeof(magic));
+
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
+		count = device_property_count_u32(reboot->dev, prop->name);
+
+		if (count <= 0 || count > ARRAY_SIZE(magic) ||
+		    device_property_read_u32_array(reboot->dev, prop->name, magic, count)) {
 			dev_dbg(reboot->dev, "reboot mode %s without magic number\n",
 				prop->name);
 			continue;
@@ -194,7 +204,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			goto error;
 		}
 
-		info->magic = magic;
+		if (!memchr_inv(magic, 0, count * sizeof(u32))) {
+			dev_dbg(reboot->dev, "reboot mode %s with zero magic values\n",
+				prop->name);
+			info->count = 0;
+		} else {
+			memcpy(info->magic, magic, count * sizeof(u32));
+			info->count = count;
+		}
+
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret = -ENOMEM;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d6..29ae39935d69 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,10 +2,13 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/types.h>
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write_array)(struct reboot_mode_driver *reboot, const u32 *magic, int count);
 	struct notifier_block reboot_notifier;
 };
 

-- 
2.34.1

