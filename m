Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584849;
	b=Mm8aNYuV0oZ0OyeywQkVjLq86f03a4rboLRssEXopNtBveQDrzdgfLBhbDk764/2+vqK
	 ydnFGPSJG6Gkmxuq6IIH7K6GNT8103xXfB4aEetd5eTMytuife3xGQG5IoZsicRjp1qbZ
	 JjaGRoPMswiEbw3MYqZYFpLF9X2l1JPevoQJe2yfhsot1Zaaec5oW3A6sJKYQm9rjExm3
	 tAi545MGXGH9XbcM49Sr9cmY74mK4fcjHW6sE7fBOwQcv9oYAuQfDCEuOYTT93EDIrhTu
	 PcfHDTO6HFkUIwSI1kCVvIufvG9gUhgTSBv4UEVqk/88LPODh17GJOg1QxvKM89RVew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h9BqSXf7g/loAE1yFy040EtHe/rxhdmlJ4V/zK4lUtY=;
	b=SrqL2y+R5/veTi+V7Nz0LrzK/VSgJDFBs2Cttf+2ITWZarJLh5+MsCVm2twGmpE5p96D
	 RhuclZYZEZhlmwQ/7IBe4Ouvquvm1/ZMtmfko+rVoXe63D2uvYz4LH+wFMKLNWPvy55ix
	 r7Kcv+zmuWz++BfiAVyvnQXV//j+K8HCYdPyehM+zRoL92aG2MnU4PDkee6VYDOnzvSD9
	 Kw/hvOURs4hHnvgZflV9VZc2iwo53mk9CuQ+oeF26pVCqUzzJtMge56vTaDTmzpttyWYR
	 miU74eYRtQwbGNAfgAp/CHxQ9nOzMasJV8klSGOt7rH/izgkRc1S0oNDLn2kHNpgygQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wj7NGM6l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCUIDhhX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961D360A5BC3
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 961D360A5BC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wj7NGM6l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DCUIDhhX
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFjNfv782308
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9BqSXf7g/loAE1yFy040EtHe/rxhdmlJ4V/zK4lUtY=; b=Wj7NGM6l+Qf66YU9
	1Q3KBVqJOhJKdDvacN+5NCa87Z1uptSvFV6uuSUhtHwFDO6Et87Mnz9leStBgexs
	LVYGaEO9IcZYy6WFmR9t0s+2si2JpQ6hHcMBdVXvGcRozbOLvgXWo81G6EFQyEWh
	aFGgeSiRkG5/oTdhLkvobSbJp26ZziSr5husz0fHOrpe0QbNEtcH9iwTfarXO7nw
	XtEztMBr0G13UQxqVnCnB3Y4gIigQUgg3+SfZtwVHkSzayAN2FtaX1uOzghhZyFs
	MgX8CdqZ29G/fRjnWTi3qNA1XlJxdwbkAJ18CeI+zqoP0fuY83kqmO0ifRkr63EZ
	lskYqw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37j68q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:47:27 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2dd8c5aeeso175948137.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584847; x=1795189647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9BqSXf7g/loAE1yFy040EtHe/rxhdmlJ4V/zK4lUtY=;
        b=DCUIDhhXMTyQ74WsPSCshiMm68zo0LpBpZjVYBD5bpfIlx83zmjK51N9gRfC97yap4
         LOBFDDVu4iWeSGU/75OyQcPcV3+7YTc0krMIV8NdPwveD3sT3NMHD3qtsKNcPTKgqMtb
         bZkiHjEZQFeZcgeKTro2iLh421b7sQj2kIGbYKw/+gQvb3MWOXLusoMnpNy1wdjHC+dZ
         Xs5KUcsgmtMDbE3EEquSlVKM1+AKBRYJLb6PQHGKfTFeYv86HPFO75JMC7xAf6yfbJaF
         6SsbMXyKbeSsaLf8gCvZ4mpc67rFvnP8b7XVRn+kjxA6BnCQUJC8J7zSNE0yBj/Apygm
         EbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584847; x=1795189647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9BqSXf7g/loAE1yFy040EtHe/rxhdmlJ4V/zK4lUtY=;
        b=qkdohSO3xylfjRnsX40Drk/36Few1jvND/9LolXIQeTA+mD/PbduCIupk8G+LyOobZ
         9Qasa2ePVtWEABsf9L4Z2ex4ljxGbtWCQY/EkDGc/mq0Ypi1/qnqwj3ARGKDluZLo/jt
         UVGdyZniWLO6tneLA+iF+lIVnNq49U+kx7aknXUbWGx+Gq4vkViim9V6PJljcW9S6OZ/
         pixbSdpQ3eZEttFBPlB7XL1SmPzS//yCOwXDXhqUg+v9BHCFnt0tfP2qIO1MK8OPIHWr
         ClvlaJk2Vo9DSPtVpXh6jpZV3OGwAV7gqLNbDxCuZly4yNCy4g2Z9kxuMgrA/liKVWOt
         z9iQ==
X-Forwarded-Encrypted: i=1; AL+hErG7e1z1EyHnzDbRnHF8CFTLYPPO5vZdUAGOBk2zk1E6cA/4mfcn7LI5FoatKKPHLM11NPbaxz9jBleW@vger.kernel.org
X-Gm-Message-State: APuU4Z9OMOTIRQJ+7/jjlJLe0hNXAhWThiLd0COHnXdNyuK2uG8FEP6A
	91GsetPcUILuiO9irPl9L+//C1YqQAO3s30VIdY/glvA7XKgkRGD/tdyy+UNwA00JUcBTbnU8k1
	M8WAvT3jdnzzRk7/BlKCuewH2U4G+REFV+CRAoaKUUZtTeb/adKUK7/XayVsXLaue
X-Gm-Gg: AYBFou3ESZRAW58m25GvvG8hULJC02D0+OfZmNAqK5Gz4Kz3zFGHdYoOvaCd0TzC2du
	/BokAZT8ciZ1I4Hap28aF9WDNf+48JOKYLSP8cHx6++2FSoKnU1qI0r3mMHq+jj661CJwUmfbXz
	6zNLgnIae9Bl0NtEY4H6sFZdL9CLCqSXLzHBm5RQZOB29tFtQV/tk8XXw3iY/hoOgmD2T9w1aBL
	Cdd1SrIhzV6hWsPcoBMPfwByI6QuEBv3K4vf9y53fdONXQYqWNzdiGAh2452yUuqLipZf37hvcu
	uU5/9F36VCB4+/7uw/y+8y70Vygm7q+9MVFxtU805LrVq+xnqcpdAc8ssYNEKm3MCQv7iSZm9Sd
	zelCpeaI9XU+1YXJK7NXIM8p264iq4Y7+GhcX4ejtdH0j+CmN3/2EyuflF7gmpTMWUCPaJtnXpn
	G6tg==
X-Received: by 2002:a05:6102:818a:10b0:7d6:56d3:f179 with SMTP id ada2fe7eead31-7d656d3f6b6mr438720137.5.1794584846893;
        Fri, 13 Nov 2026 07:47:26 -0800 (PST)
X-Received: by 2002:a05:6102:818a:10b0:7d6:56d3:f179 with SMTP id ada2fe7eead31-7d656d3f6b6mr438690137.5.1794584846353;
        Fri, 13 Nov 2026 07:47:26 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:09 +0100
Subject: [PATCH v2 09/10] gpio: shared: removed unused field from struct
 gpio_shared_entry
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
Message-Id: <20261113-fwnode-for-each-prop-v2-9-4edc23d5cf50@oss.qualcomm.com>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
In-Reply-To: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
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
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=i7zxMYAqFJUyBEqlPaHykWLWPCM6j49xHF61fQqcpus=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD4bbsGTYuR8B/fRFJSRBUVofe0VmHcgz9pU
 v0FuTOm/3OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw+AAKCRAFnS7L/zaE
 wwLaD/9WxTlodVpdLurb93SMv5oTkU/VAxD6kKUIZOuZi/HfbDhtu4LmbA3Z4/7Luuintp/9wLs
 CTn9APhLzVDzgFuscV4tJNZqp+OuE9bSE1uiyUvm3+r70NDyDpSYB82dxdnqOAou3pyMLJMBtaL
 Vynofja76JRvf0UBpZUbTpMiOkx7L3rI35hXYrIAbMNnAlAJLDGOSWd2CTqBGPav/sVjSjGUBIl
 7qihCvOw45kdP3kX9FeLrDjYZ69Ro1c6lz/xXD/zQIi1UMAZVm1gnIPsNl1QfGKtyk8rJu5T4Tm
 oiJlqzTbBHlqLUA5YdVwBBT7AZ6l9fvHv6CIT6+6qiX2f/uUy6lo29Ymd4UdxNJtkBFR8JlWTvs
 UnHl4u39eSU4I+8cv/EfLURPd7+3Pkxxa3BdFWMhMtLR3gxz9BCk8Ek/2gkdtiTDc7vrw54zjM8
 YyxA9YWiUiTYpgjkpcXipszOHO7wm8VNqLAGY8/kwHdGwG+FaGT4Ip/nQ+VM4XeiDhys9IotMlq
 lSn1fSkjMCzffyo3cpjWwATrJlx9xiYHPaJcFw+LvpOf0I6Mj9Hhd0fcoufJnisday+AoBcRHnY
 lnCWjmnXBcsEIs5gC1q2MtPR7Ii+g3Xu6xenhGuYeE/H5mHefQwJ8OpII6KluZ2ku4hqbskeepR
 zau1tf3u1k1DAQQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfXzoXRKbNy15ES
 0pfkFlE8QTHtsyi3V4dZf21Lf6mPBbYRoqY4JOP/nGGdCLysiE0CXhg+opcQ4M0WQdKIH3Q/ASL
 IcEQFi4oKSeYEFS/Nppw8JbZdSXpet0=
X-Proofpoint-ORIG-GUID: CXnYyS9MqrKLp2JsLOmAMLOJCvJA_fqu
X-Proofpoint-GUID: CXnYyS9MqrKLp2JsLOmAMLOJCvJA_fqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX2wJziu3pB8Sp
 5914AS8Ul8420GkZ1PJ8I4hWz30Itcv2JbPgSxdiHA9356ZZPLR7WJ5Vcw6CuT2YyX2tDlavAuA
 R7oe7LYXNShtY31CoEsrw19ZjGbQZtt7mdW2S7voWnuX2qqMyzaCpd0YMNi/OxvOAQZeE8cYq/f
 KHPAKvOcGp8umKFAm3fCD+3pXraa736Az/bkLv8QpIlHz/V5CiRO55Ftg1ayheW5ontMyZS5ufn
 Ue6OMLl5Rsx165d0IhTW/k8ZqXzW6VyzuizBhM9cqec0KDpYXr5+W238Sh05zoR062bsGPsTyIU
 W7mby9/dtLxuE6qRJc3QevuLW9wOFP3nIGpkfd/HQO0Sn+hMqOpvN2mll0yb7rkWmjzE0Oa/BAu
 ApBibrXKxusbv6KfBVCBJqxIUV+ViBF7MxXISrd+/8T4927L3xBjqsK1LBsQ7pH2fuWEXEos7KY
 DYyDAmAZn+9467NZ4aw==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af7310f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=RTVOz5xmJnInBJjvJB4A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130062

The index field in struct gpio_shared_entry is an unused leftover.
Remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index edb04a5bb987e12faf96e5b70198a9fabf60ad0a..44af3bc1494e47310973844a0ef19ac3ec5cd719 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -51,8 +51,6 @@ struct gpio_shared_entry {
 	struct fwnode_handle *fwnode;
 	/* Hardware offset of the GPIO within its chip. */
 	unsigned int offset;
-	/* Index in the property value array. */
-	size_t index;
 	/* Synchronizes the modification of shared_desc and offset. */
 	struct mutex lock;
 	struct gpio_shared_desc *shared_desc;
@@ -233,7 +231,6 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 
 				entry->fwnode = fwnode_handle_get(fwnode);
 				entry->offset = offset;
-				entry->index = count;
 				INIT_LIST_HEAD(&entry->refs);
 				mutex_init(&entry->lock);
 

-- 
2.47.3

