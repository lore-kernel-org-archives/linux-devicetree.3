Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801080;
	b=UI3uWobYRhh0uOt2P93SP3gsWBucXl8LZYFZuX/iDQyR6vimf6AEZ3YnhdTf4veJ1ECB
	 SQRh9pjW5S5YHy5YeSaF+4d8Gam5xHFwKYyBsQPFSb87LVJSE84f+rAewx4uot937PmHG
	 K6wwdLPpHI7E+iR9qtagqskKrS3nBKLg/qfXrg0sH8XP0SlzxrXmTaNXGgCyIpnNeKhqH
	 ESrD2ewCZeg4/F8OAnROU4ed8ZKveGY4BdF3i26e1j7BhWQoMT9ajqnR9vqSDkyF16gTJ
	 D5cyIvDqb2iicUTK3PXkE7SKAYKAAYDdpCrg46dfCV4b2AuHzbujXTB9T2S7FpOgYkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=;
	b=qwKciguBGiG/sfQQ+sChIX+gW/NiQaZgOOYAXGg9goE8FzEtH1LfTfDR1BLdaznqP92z
	 +q8Hbk2reSVzDKHJ+Wab20OhuEZBHe4JIm+Cmr4feKxmbTZJ4VdzGS6XLi5Uk4j9nC6Ty
	 E2ktiEQln9yw/xmzOq4G5U9Bq9iU+isJoICeX/BgFovbeoS5Asg+G09PBP562yZ453Foy
	 FrHZ7sy+kMuzqFnpdeLDMHGoxmehn4n4zVNjRiJjMYDARRAflY25zF8WBTGVMTxRfV8BA
	 mgYVI0i1cHnBrUN0N1c70dLGwgMXSU/p4dOatTnPiDBx6PRpGXsXKYWclBCkX8Ppgdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n6BlCfAp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NvbfJL/y";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A263606EEA6
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A263606EEA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n6BlCfAp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NvbfJL/y
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba2SH1150070
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 14:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=; b=n6BlCfAplDkRIGJY
	OtZvEiHnmJxfVXUqgCmbQ3HY4qMos58f49uoPT2qpuxiyvNqXiZUg3EAZ5KwManW
	X/P1irYdeYwkWlRqhibdk0ToPW3KLNnTBRwQTibR6cnH0c2CL3909RF2qxFC5T4z
	MRmi9u6ZWWSk4u5RY207c56jDfI53aj3If+toqprwFx9Ltygiea/igBKX3yIXB1z
	2ASo1yVQ/7vqLDwKgTyjFS0FLODgtQOWhBH3BwSI9kvYT9eMd0/0Aucly+AJ/ijl
	ncAoe+ZbTi4hAD4DoJLZaXlEQGcrbpqC04GepOi+liW37GrSLDaBhRL1d4h7xKaf
	1U6CiQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y435p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:04:39 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ec17386b57so593289e0c.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801078; x=1794405878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=;
        b=NvbfJL/yWxdly0mzMB6/yTHY5+E/Ed5Ks5a5IdsMVPNmio7uI50dSuB7OPdrgmR/iJ
         YzLCDOysbwjZmCAMywp1x1GvF13tF2X9QjMhslJc25ut4RmcRt3DBjP11Xc4iBGPT5LG
         JsLzl1Qqh0aprVLr0n6i/Iz2oVbOVnPXml+LGzbZAn4dCjd8QOkXq+DVyI9bAuKnncvh
         eR4x0xTwt5J1NK2j1Ee6jnMv1eRQMybnj0OIj4P59aWcz7CRxzpPSI4hP9tVhkKr7JsB
         PudwoIpfe0kOpaNwiJeTBEvECxLxzoKJhXYEuT3MFMed7j/Nt4xx2Q93r/0kRIZOZUrj
         wE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801078; x=1794405878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=;
        b=B8rX6KVm1S85hXaSRdhtuMlayvkWcuVR91kxNi2gxvqoWBWdIJGCR47HM395lPyU8I
         bhzGuHZHPHkmU2HXDZjBn8GGYows/mvSeRCHoBGF6AOrBQ341R0yFY0dJdpnPRPkMCWr
         /AE5N1Ln/VbtLsxA00YtQWeOxS+1lDYj51fG27RrYw38Sc+3j5Uelms+B0iCSfX5WJ/d
         JPo8X4x10EJIHw2KMw+JJ8Tp+isq3NrERycSfrcnI9uDkTlAazrovgGxX+jrRLPF5p6q
         x8+Fuy3/ikTgDshBZSL8+CbFm5kT/waQEYhBxBLPonivnrKnunn3BaDpL1jhtvi7ya4K
         FVYA==
X-Forwarded-Encrypted: i=1; AKwUvBz2ELALM1O/7MONxurnpZfl+xzyUro6UQd7DbSKLogPEmAIDUCz57xGbZnXMRFThBNxoC3Ytw+IyYmZ@vger.kernel.org
X-Gm-Message-State: APuU4Z9aYF4uEGmMVaCGcddIA9T+I68+J0P6hTlN2iPQnMjYP46b+Clw
	vHhNvbfjVQe8WPJVCHDkFxHFBTGAnAuKJCK4A/BqH9Wqshf1d6vnxddStRzWgIvagyjRQtZA8QN
	k/gWI4GCuKvyAtakEIUl67NzsQVupXTmT0uIR/7FojMAidrxWmsisfj0pkrlvRLGw
X-Gm-Gg: AYBFou0xRFHrmUQohZzmQQjK/39WUy9DlyQFEAfwm35yCNioL8raEKmC12L+WyxGpdO
	+QDRLf9lCB7GeZQj/y9Sy7iRkyWEQsHrdJBGpRhyUQWokyM8mHh7z7GV+NB2+5z+P/4MSQA1o7Q
	7UKoQ+WDHZJZYYxvArBsTYzWrIy2y1ywtCg4KEXht2I5f69ZYgwb4JlKyruv5s2tKnmGtMC4lXP
	ib1rXpQH7FpE0vZTKSET045AdzJuUa7wIl7Ose5pD/A+CfN/diYDIUiS2eAsSGM6y9+Dp6/eeQE
	71g2ud5dnyW12QRHYhVjefULYbYATBjgg8OENEgRZ4RmnDNdxX3WNdbAzGtGOQu4r1w6QuFPqqb
	gss1Sp9PoEtLyGaqSr7frdfG+/ft7SMcEm7W2xaIPuyrH62Xb9PYJ+2LuRxbu5px6QSnLuCZyUg
	pcew==
X-Received: by 2002:a05:6122:c89:b0:5c9:c60e:3a48 with SMTP id 71dfb90a1353d-5ec689f696dmr7593934e0c.20.1793801077993;
        Wed, 04 Nov 2026 06:04:37 -0800 (PST)
X-Received: by 2002:a05:6122:c89:b0:5c9:c60e:3a48 with SMTP id 71dfb90a1353d-5ec689f696dmr7593898e0c.20.1793801077646;
        Wed, 04 Nov 2026 06:04:37 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:50 +0100
Subject: [PATCH 8/9] of: property: implement the count_references() fwnode
 operation
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
Message-Id: <20261104-fwnode-for-each-prop-v1-8-6e28fe1c72c4@oss.qualcomm.com>
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
In-Reply-To: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jfcJL94RVspgN8CyK/snZo0rp9b0uidqlV9W3mfnsrY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSrVGZJPcf5ImbusE8w0YzObuzDwHNwk2vf
 XWwfHOBNamJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w2USD/9+/oAE3ozJ0woCpNJfEKxkKc6OkP+Fp13bf7ApUWvG71blBdfNz430uIpxhii9lx9NSHF
 H5yKot93opIVe4f8X7I07vIwVAQBfP1dtTdnVWavMAELyhSWVOIQX2Lp3EFd4Rtky9afjzaw5CJ
 n2zulXoabInrDbALeCiYXy7xfflbtsynqdIjm6SLgnLpb4SURUSTbySU1yoF6hIZLyU9GmQ+Zm/
 A5D4lBHWrYNUZL0OIcWQvWX2Rq/S98QJJAzublBzvLUImTHuwL2SuDBQA/qMIjc8oKlukqHP+/l
 QGKLXZ/T5ru2K9z8VOZXMD6tyZBzMrVvhZSIBS3UqsgNlS5FSNVGiBR5bWprnwdgXI59W5smAKT
 toEgXdyTdb5o5ZUIziSIfpQabmoln4rKHRISWIGZQ8WuqucOi1iVa2XCEQKsUkLiy82wmALNRKD
 uPDnmLZQVGnDdSWcMrHPAQ/qWTFNV4K1lClnzSLHITbCd5uM4piou2+lxdYgbR9X36K5wP2jxS4
 areuRfuUDSYwSS/3EZBlTtUolLcKcPFlfrgY+TPvIuh8EPLSKz5Dc+BGF15ed3UqLsy8M2yU5GU
 GxstGJJLPGB+wYvlupd0Y9JXoZFvF0wuLIWD1XqR7FCCgW3to2+DXgWre+0LHZF5xUFVpyD9SjA
 YNWIV37TclMW99Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: J02KL9WfrjNhiQ883TLcRbiHpUKr3t0L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfX1wLWN5GX+ZjZ
 YL/L0txGtgLZK6tka/8yCH2XaEhWEgZlHQYAhfhQslxhuo7v+vVgVxQjzIwnrrk4qPepgxJKeib
 9SAegm4+OfgXwhqzYnNn6RcHnwZKZAi+63fVwpX/gMEh5Qac6qTnDg4LOZLGuDmoi7Q/MjIV2GI
 8MB/kI9Pub7MNcxobPkBLxV6DYXerV24tQ3TN5Ejdq27Ol3boNo4GV4KnMrYsYM8ZZtBCMnO2KJ
 cy18kua/7ZoEVSIVzzkQ9GSy6erjThrn5SJgJY3FuUo1xhG47jBZCxwlgYesbu2Opsyx4RuP+y+
 0TptzucbErV25mP9xVF8lbgqG8x7Vvfku1MTKHVio36xfSt0FWiKvvoBScWySB8+/aFt1LQcKW4
 sCBUG9zR8GLRUYEohLS7wrC6sQ/mHgWmkRfy6oY6huhCdreY6yNlVLB3ZY6uRNaul00YGH0phX3
 uRS9thnOEeZFkGKsKvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfX9M0m4bYxIVgc
 JZLEW3gdhmZRPzl8vb9OH0B2Jopox1QnYkJkRIpCRU4keY867ZTDKPuPNNTWZ6EqDU0S+0eM5re
 dBVxdL2faf4nhtP02XLbLT7bFuhCwv4=
X-Proofpoint-ORIG-GUID: J02KL9WfrjNhiQ883TLcRbiHpUKr3t0L
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aeb3b77 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=zSBz9IY8uK3Zdpgw7pcA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040056

Implement the property_count_references() fwnode operation for OF nodes
by wrapping the existing of_count_phandle_with_args().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 16c9c307633bdc7c9343782b1cd3bdb845552c6a..ae2561479e2382b241fd87dcddf52dc7f52a950e 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1231,6 +1231,12 @@ of_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 	return 0;
 }
 
+static int of_fwnode_count_references(const struct fwnode_handle *fwnode,
+				      const char *prop, const char *nargs_prop)
+{
+	return of_count_phandle_with_args(to_of_node(fwnode), prop, nargs_prop);
+}
+
 static struct fwnode_handle *
 of_fwnode_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
 				  struct fwnode_handle *prev)
@@ -1747,6 +1753,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.get_parent = of_fwnode_get_parent,
 	.get_next_child_node = of_fwnode_get_next_child_node,
 	.get_named_child_node = of_fwnode_get_named_child_node,
+	.count_references = of_fwnode_count_references,
 	.get_reference_args = of_fwnode_get_reference_args,
 	.graph_get_next_endpoint = of_fwnode_graph_get_next_endpoint,
 	.graph_get_remote_endpoint = of_fwnode_graph_get_remote_endpoint,

-- 
2.47.3

