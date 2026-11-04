Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801085;
	b=xD41v9vykGtPPuaOE4Ask9RhP5NmPjkDNsAcs4b1XUamtlwy0STTd/jV+AlHMnOYDwcP
	 OncWtRVeUqAo7r6jnGW8AoAz4LnPZPZSHse+gAZwj3UDjT3xGHWDSXd5ZLrJ8sDHXMCnt
	 zybQ6572B07G8oaGWHtG8+vT+f1Wz6/fvEa2mMnwwJya+aeRtdWAmHJ3IIu3rINUG7IBu
	 DgtGODzKQOKGxiNhgWR0cAwqII1kpawg6NWtqG1SJESvKy5w2xys1sYOh6Ec+wOIV5ptW
	 LjIRr+5JLJ4nePlRkAqfwGB/A2LjDVyTF7Y2rci7NSh9donYvmUxrDy0TQ+XBnALHbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CvpiuG2v7LqsgYioH9W2BL0A18x1i9O8dQ1j4rntT/0=;
	b=1Mz8KCDJnyLHYdQxg+cdFUYowL6iKYropxzN89uJl3BftH43fyYfIasXSQ7bLUc6QbAo
	 ZKC2AiUGm5WF+/pHDIlmkuc/Agm7EIgE9z0BceiRMkQ0znsk+S4MoBgt5qC+AHBXQE4mh
	 ggiOjILsNvesqvoCj81TnIyQDbP3ljlN9HCpTsHMvdH8q+AoH6mcF9yuxCQZaIz7EtE8e
	 Pz0nRIQbNwZKDiaau5BpuPjmTeq0LQD9YqLsiLoN9lbSXsveUQxbNVxUZu4MNaGPY3SLO
	 QfIhLpxNDoLEUHTGGWEK5Lh2YrKsyYMc9tvoH28P2psy5XsK9tWYYk2/itJ64SkaHxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c5t4RPmy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ezWqZaom;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC06606D821
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EC06606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c5t4RPmy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ezWqZaom
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZrMp739147
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 14:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CvpiuG2v7LqsgYioH9W2BL0A18x1i9O8dQ1j4rntT/0=; b=c5t4RPmysFcyTYBU
	gl3xLV5rm95mUnO2g888eol71FJq/lJnSkg+q27jKn6y1IrIH5wJ1XcVx+Ved10L
	VPr+KnEzZI/Zr0xU/Q3GzaWj2N7jM3HzhXoGWcg6XsPvsjFn/mHrYVJiR2tccSy1
	9jdXY7BHNogQPf6oFPXcMOReKGsUOlrnLVGgFhEeVHCtznJOJAcBNMR97EV51Dpf
	OBf/ZpgNdweXsCyXC+xxL2WT0lky8qI6cLbpmGeP3Jpv3M5iJAbTk3K4MhQJ/sZZ
	v9WPQRCZ3rYHYjv/2spmuT0H5P+XQSN3ic9Q1iZMTUBHqRiN97H/eoRZDeGOXP4s
	kLzJcA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163haka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:04:43 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ead43326a7so62757e0c.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801083; x=1794405883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvpiuG2v7LqsgYioH9W2BL0A18x1i9O8dQ1j4rntT/0=;
        b=ezWqZaomCipUIxZRKXnpY8uhf7IjnJFuEIOYxYzRoAEYHYeDhZA4buWShJCDhDojF5
         0Fg0KOER+KVzb8kPWH5bzhC3tqvjLqHNGCCdnulD8YZi/R2TDv19977Pp6rda9gyJF2t
         +FsOIvBNjLN1IlXMd/hqzl52Kn+67Q7c+kSmhPKlCnaKLW3BKz+Qly3oFbVgp4SUcAfe
         v5s04n1TpQErTFmLmJyxCwh+AI98kClCkkHjtP7kLilaRZ2kK7/sp75DHpuqmkdjaJqe
         qOjqM2TZ5pkROtqiUS1ujOHnhGas/6v6NZzIKXZ4jSgc00Xx9ZckJe7Yu3+QfHgxqQpW
         KjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801083; x=1794405883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CvpiuG2v7LqsgYioH9W2BL0A18x1i9O8dQ1j4rntT/0=;
        b=iYT4c26qGMzVhsu68F9HCKOdyUN9ItRLzQ6dCYu6X8dAsSkgDThl8BiPf/JKaEMR3u
         R3zkuNuA2XSXAT6rh1f866bNTdIL9wa0R+q723D402LyxKBxhjs6wTfOrpXur0pjP7Pl
         40eAlHonl76OCN3RuEnbfarxOmzPAQgYB3CEkG0KKQVyG1RMAFOOGCi8wrbfqWrPjfkw
         UPF8pHOoXHNCNwytXFX4FEvzkgb5FLtrDCyCrVL3zKRO3KRt2DkDrVNYn4opFkioPQcw
         yl9wY5ntm3rTKv2DoVccIx3VD0Ya+vrmBJzQw1fbJTpxd6UbxwWXicKdclEjHeplebA2
         z+bg==
X-Forwarded-Encrypted: i=1; AKwUvBypwYYJUpBccEG9cjL2Cjk+3QEo3wjZ5ir9D7Rq3yIn+a2pgnD59sN9rcCxWbqIek8d6BzY+3jviZdi@vger.kernel.org
X-Gm-Message-State: APuU4Z+viHsjDIvgJqvD6lJX1Kw9BgmOVNbW+zhPZDOSTMCaCidUuVRf
	WGPo39oCfZwGi3X1CXh+dFyOl0W0UU4O9SIA1pOaHxGw6b/QvCdE0XnDxNOXZJ+tiX1DZxadqU1
	u+dfkoiR1OaLeH3Da69GyDvQ2XeeocSQXVUCdG1A/xydre8eE2RNPPuezPX457/f3
X-Gm-Gg: AYBFou2fniNeab24Ogalo6RIEzbBHyE1S/5D9ovYeP/ayVAL3YH35lt6e5hxz8R9XVX
	vKl2vtNP4Rahx5CbCy4hBWCuEexm7ZWEDdOWIDHvbVmW/jfH/pRUREMgwFUDK1xQCa859wyFQt3
	0wZSsPzgZyM3SaKI2nDIe9YjFwRg0p+9ZiI0d5inoDvb0qwTdpQys3j1S35UW1IgmpjcO+nEd4m
	2s1j5xljQzT6BjZPIRO3D2Xng9HZH/aARsWphTp2VHKyqSPd8SwIypKa7tbuj5v2qGtbgzbqena
	X9UfPzWjKmvZxJhoOYbDfXRNdo8oLwsO4dYp4Bl61/3d9w93pPp2Nby7tzel7L1TW6lfN7i/1hb
	JuoLna9iPVzcilQHVky6rpt8Lf3TxXYIIJNU/vrVurFG7uFWBpIk+aF6WBf0CXMbFwdkrqQRv8Y
	vvtw==
X-Received: by 2002:a05:6122:3c54:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ec68971961mr7027645e0c.15.1793801082553;
        Wed, 04 Nov 2026 06:04:42 -0800 (PST)
X-Received: by 2002:a05:6122:3c54:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ec68971961mr7027502e0c.15.1793801081438;
        Wed, 04 Nov 2026 06:04:41 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:51 +0100
Subject: [PATCH 9/9] gpio: shared: generalize most code to firmware nodes
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
Message-Id: <20261104-fwnode-for-each-prop-v1-9-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10683;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WAePSYcqwmx9zFDVEtTkMdht35rLwyfSp8xtwHJeP9A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztTe/ygpY5Gk49WKX0BfmDIFYf0/pLuvhnEn
 bpip+H0OCKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UwAKCRAFnS7L/zaE
 w1d2EACOyKpj5dhBJMlbVVapisSgNcGsb4M7PItzp/Lx9O7KynE4un8oyXXsZBuFyLWSC8lP+yV
 I/tysH+DWRbKEmIuMgCxjZVRWURerYG5oPKtmlnal2D6JF+exsSkm0++B+wu1SLMlicRS0oaAta
 MIMd0krCpM3V3DV1ucIE/hQ8QgV48uKx3dfJQ+/byirds98knrhqFq5wUeNyvLzyPF21TuGAyYv
 JKtPh+Mv+aZfPc7pp93EurC0VA7C2ziPqPdBl5rjrX8rHS+wWTnKravvLXsHEPvmvsYuFnr6Zwn
 zD7OK07UB+gXKSRqQO8te1pnQsYg9ny20ozpzdGUSvw2nBFlDz8oBW3OSLAxxcJhYAlBwfKT2QV
 LSqpbHtxmU8t5atIp55nrLV4O+jF+cLB+zydST+v5xsMAQ3qfVTVhFVkNPQbd2UCoOd6/DdEW00
 iTOiPgQuYoWtWcYnev5tmQwZfpuKP0hWYBcNecvfAM/xqV6XfC/yLx4JX6tTxvJNHhO23tvfmw6
 +U4F9ofABssgmBf5L8q1AbcGkKG+/kxgs11ZNY1AyW3gSYJqxHIFpPLP0gMRF3T20O6aG2P5yPp
 7lPrjHWWLmHw9FkEGzmMwB6clhkpiKyfcwTtMzfZ0tFpb+bw34caFXqYMrXS7wBY4NthrPvUB0Y
 RUEyG2TYSTqRmmw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: EW6b0y_CGmS-tjUM519qXDLt3LyWqYX0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX7NJcjKzPePr1
 GaQc+0NA3CLRmgTUy/MSjN4VND7L2Nxuv0OvzqkBuBzU6nivuPfc8TkHtcgKadfICjMq4JQVfQe
 GeczdLW1158hSSkowp3aNhL61fL+990=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXyiSrqe+w83xS
 C9LyUybJ5MWPqWOBJ2wUle2VbJRyY3UTchQZ0q0GvHxN/gL3hQ5gG9k9+8T5jxoBjSlET0oowMV
 D/Ctj6h412SHfAGbNUh1/UirOICIkhj1Ac0Cxo77IHB2UaRB56q+8H3yIpfl4Hp7zFjxfRFkS/p
 tRFvxKIUh1zivrvGfErZIP3g+dluT+Iseq3Jxe4K7ON52obBWdrZjPmyxeDNj9CuRcJxRUB/SsE
 lvEekyYd0ckDnsbWpLriZquIYf+ocYLtDhzDJbYObPWwgajbUTqlBm0YTogLUqieOhwCdZmLYac
 QzJOWC4spWNp2hQjXNC3LLRhzXHAHAUFs63XYCtzBrBJ/0ei+E739gsgSMdZji8yXZDJAMBqF3d
 mZ9xpanIPXLq6EjXZFFzEvaNaFgREkPQjxA9k3r+zDl6kRLmrGkbT+Gchgor77528pMlHMW6B0a
 2Mp5t0datXhIjeEsn7A==
X-Proofpoint-GUID: EW6b0y_CGmS-tjUM519qXDLt3LyWqYX0
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb3b7b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ziVQ5hnd3nnfPSIR4FkA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

Ahead of adding support for sharing of GPIOs for other types of firmware
nodes, convert as much code in gpiolib-shared.c as possible to using
fwnode APIs and guard the remaining OF-specific bits with CONFIG_OF
guards.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 241 +++++++++++++++++++++++-------------------
 1 file changed, 131 insertions(+), 110 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..58ac049bb603e2946c81e67a047b4788d39213b4 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -23,6 +23,7 @@
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/string_helpers.h>
 
 #include "gpiolib.h"
 #include "gpiolib-shared.h"
@@ -63,7 +64,7 @@ struct gpio_shared_entry {
 static LIST_HEAD(gpio_shared_list);
 static DEFINE_IDA(gpio_shared_ida);
 
-#if IS_ENABLED(CONFIG_OF)
+
 static struct gpio_shared_entry *
 gpio_shared_find_entry(struct fwnode_handle *controller_node,
 		       unsigned int offset)
@@ -133,158 +134,162 @@ static int gpio_shared_setup_reset_proxy(struct gpio_shared_entry *entry,
 }
 
 /* Handle all special nodes that we should ignore. */
-static bool gpio_shared_of_node_ignore(struct device_node *node)
+static bool gpio_shared_fwnode_ignore(struct fwnode_handle *fwnode)
 {
 	/* Ignore disabled devices. */
-	if (!of_device_is_available(node))
+	if (!fwnode_device_is_available(fwnode))
 		return true;
 
 	/*
-	 * __symbols__ is a special, internal node and should not be considered
-	 * when scanning for shared GPIOs.
+	 * On OF-systems __symbols__ is a special, internal node and should not
+	 * be considered when scanning for shared GPIOs.
 	 */
-	if (of_node_name_eq(node, "__symbols__"))
+	if (fwnode_name_eq(fwnode, "__symbols__"))
 		return true;
 
 	/*
 	 * GPIO hogs have a "gpios" property which is not a phandle and can't
 	 * possibly refer to a shared GPIO.
 	 */
-	if (of_property_present(node, "gpio-hog"))
+	if (fwnode_property_present(fwnode, "gpio-hog"))
 		return true;
 
 	return false;
 }
 
-static int gpio_shared_of_traverse(struct device_node *curr)
+static int gpio_shared_fwnode_scan_property(struct fwnode_handle *curr,
+					    const char *propname)
 {
+	struct fwnode_reference_args args;
 	struct gpio_shared_entry *entry;
 	size_t con_id_len, suffix_len;
 	struct fwnode_handle *fwnode;
-	struct of_phandle_args args;
 	struct gpio_shared_ref *ref;
-	struct property *prop;
 	unsigned int offset;
 	const char *suffix;
-	int ret, count, i;
+	int ret, i, count;
 
-	if (gpio_shared_of_node_ignore(curr))
+	/*
+	 * The standard name for a GPIO property is "foo-gpios"
+	 * or "foo-gpio". Some bindings also use "gpios" or "gpio".
+	 * There are some legacy device-trees which have a different
+	 * naming convention and for which we have rename quirks in
+	 * place in gpiolib-of.c. I don't think any of them require
+	 * support for shared GPIOs so for now let's just ignore
+	 * them. We can always just export the quirk list and
+	 * iterate over it here.
+	 */
+	if (!strends(propname, "-gpios") && !strends(propname, "-gpio") &&
+	    strcmp(propname, "gpios") != 0 && strcmp(propname, "gpio") != 0)
 		return 0;
 
-	for_each_property_of_node(curr, prop) {
-		/*
-		 * The standard name for a GPIO property is "foo-gpios"
-		 * or "foo-gpio". Some bindings also use "gpios" or "gpio".
-		 * There are some legacy device-trees which have a different
-		 * naming convention and for which we have rename quirks in
-		 * place in gpiolib-of.c. I don't think any of them require
-		 * support for shared GPIOs so for now let's just ignore
-		 * them. We can always just export the quirk list and
-		 * iterate over it here.
-		 */
-		if (!strends(prop->name, "-gpios") &&
-		    !strends(prop->name, "-gpio") &&
-		    strcmp(prop->name, "gpios") != 0 &&
-		    strcmp(prop->name, "gpio") != 0)
-			continue;
-
-		count = of_count_phandle_with_args(curr, prop->name,
-						   "#gpio-cells");
-		if (count <= 0)
-			continue;
+	count = fwnode_property_count_references(curr, propname, "#gpio-cells");
+	if (count <= 0)
+		return 0;
 
-		for (i = 0; i < count; i++) {
-			struct device_node *np __free(device_node) = NULL;
-			char *con_id __free(kfree) = NULL;
+	for (i = 0; i < count; i++) {
+		struct fwnode_handle *ctrl __free(fwnode_handle) = NULL;
+		char *con_id __free(kfree) = NULL;
 
-			ret = of_parse_phandle_with_args(curr, prop->name,
-							 "#gpio-cells", i,
+		ret = fwnode_property_get_reference_args(curr, propname,
+							 "#gpio-cells", 0, i,
 							 &args);
-			if (ret)
-				continue;
+		if (ret)
+			continue;
 
-			np = args.np;
+		ctrl = args.fwnode;
 
-			if (!of_property_present(np, "gpio-controller"))
-				continue;
+		if (!fwnode_property_present(ctrl, "gpio-controller"))
+			continue;
 
-			/*
-			 * We support 1, 2 and 3 cell GPIO bindings in the
-			 * kernel currently. There's only one old MIPS dts that
-			 * has a one-cell binding but there's no associated
-			 * consumer so it may as well be an error. There don't
-			 * seem to be any 3-cell users of non-exclusive GPIOs,
-			 * so we can skip this as well. Let's occupy ourselves
-			 * with the predominant 2-cell binding with the first
-			 * cell indicating the hardware offset of the GPIO and
-			 * the second defining the GPIO flags of the request.
-			 */
-			if (args.args_count != 2)
-				continue;
+		/*
+		 * We support 1, 2 and 3 cell GPIO bindings in the
+		 * kernel currently. There's only one old MIPS dts that
+		 * has a one-cell binding but there's no associated
+		 * consumer so it may as well be an error. There don't
+		 * seem to be any 3-cell users of non-exclusive GPIOs,
+		 * so we can skip this as well. Let's occupy ourselves
+		 * with the predominant 2-cell binding with the first
+		 * cell indicating the hardware offset of the GPIO and
+		 * the second defining the GPIO flags of the request.
+		 */
+		if (args.nargs != 2)
+			continue;
 
-			fwnode = of_fwnode_handle(args.np);
-			offset = args.args[0];
+		fwnode = ctrl;
+		offset = args.args[0];
 
-			entry = gpio_shared_find_entry(fwnode, offset);
-			if (!entry) {
-				entry = kzalloc_obj(*entry);
-				if (!entry)
-					return -ENOMEM;
+		entry = gpio_shared_find_entry(fwnode, offset);
+		if (!entry) {
+			entry = kzalloc_obj(*entry);
+			if (!entry)
+				return -ENOMEM;
 
-				entry->fwnode = fwnode_handle_get(fwnode);
-				entry->offset = offset;
-				entry->index = count;
-				INIT_LIST_HEAD(&entry->refs);
-				mutex_init(&entry->lock);
+			entry->fwnode = fwnode_handle_get(fwnode);
+			entry->offset = offset;
+			entry->index = count;
+			INIT_LIST_HEAD(&entry->refs);
+			mutex_init(&entry->lock);
 
-				list_add_tail(&entry->list, &gpio_shared_list);
-			}
+			list_add_tail(&entry->list, &gpio_shared_list);
+		}
 
-			if (strends(prop->name, "gpios"))
-				suffix = "-gpios";
-			else if (strends(prop->name, "gpio"))
-				suffix = "-gpio";
-			else
-				suffix = NULL;
-			if (!suffix)
-				continue;
+		if (strends(propname, "gpios"))
+			suffix = "-gpios";
+		else if (strends(propname, "gpio"))
+			suffix = "-gpio";
+		else
+			suffix = NULL;
+		if (!suffix)
+			continue;
 
-			/* We only set con_id if there's actually one. */
-			if (strcmp(prop->name, "gpios") && strcmp(prop->name, "gpio")) {
-				con_id = kstrdup(prop->name, GFP_KERNEL);
-				if (!con_id)
-					return -ENOMEM;
+		/* We only set con_id if there's actually one. */
+		if (strcmp(propname, "gpios") && strcmp(propname, "gpio")) {
+			con_id = kstrdup(propname, GFP_KERNEL);
+			if (!con_id)
+				return -ENOMEM;
 
-				con_id_len = strlen(con_id);
-				suffix_len = strlen(suffix);
+			con_id_len = strlen(con_id);
+			suffix_len = strlen(suffix);
 
-				con_id[con_id_len - suffix_len] = '\0';
-			}
+			con_id[con_id_len - suffix_len] = '\0';
+		}
 
-			struct fwnode_handle *curr_fwnode =
-				fwnode_handle_get(of_fwnode_handle(curr));
-			ref = gpio_shared_make_ref(curr_fwnode, con_id, args.args[1]);
-			if (!ref) {
-				fwnode_handle_put(curr_fwnode);
-				return -ENOMEM;
-			}
+		ref = gpio_shared_make_ref(fwnode_handle_get(curr), con_id, args.args[1]);
+		if (!ref) {
+			fwnode_handle_put(curr);
+			return -ENOMEM;
+		}
 
-			if (!list_empty(&entry->refs))
-				pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
-					 entry->offset, fwnode_get_name(entry->fwnode));
+		if (!list_empty(&entry->refs))
+			pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
+				 entry->offset, fwnode_get_name(entry->fwnode));
 
-			list_add_tail(&ref->list, &entry->refs);
+		list_add_tail(&ref->list, &entry->refs);
 
-			if (strcmp(prop->name, "reset-gpios") == 0) {
-				ret = gpio_shared_setup_reset_proxy(entry, args.args[1]);
-				if (ret)
-					return ret;
-			}
+		if (strcmp(propname, "reset-gpios") == 0) {
+			ret = gpio_shared_setup_reset_proxy(entry, args.args[1]);
+			if (ret)
+				return ret;
 		}
 	}
 
-	for_each_child_of_node_scoped(curr, child) {
-		ret = gpio_shared_of_traverse(child);
+	return 0;
+}
+
+static int gpio_shared_fwnode_scan_properties(struct fwnode_handle *curr)
+{
+	char **props;
+	int ret, i;
+
+	ret = fwnode_property_get_names(curr, &props);
+	if (ret <= 0)
+		return ret;
+
+	CLASS(strarray, names)(props, ret);
+
+	for (i = 0; i < names.size; i++) {
+		ret = gpio_shared_fwnode_scan_property(curr, names.array[i]);
 		if (ret)
 			return ret;
 	}
@@ -292,19 +297,35 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 	return 0;
 }
 
-static int gpio_shared_of_scan(void)
+static int gpio_shared_fwnode_traverse(struct fwnode_handle *curr)
 {
-	if (of_root)
-		return gpio_shared_of_traverse(of_root);
+	int ret;
+
+	if (gpio_shared_fwnode_ignore(curr))
+		return 0;
+
+	ret = gpio_shared_fwnode_scan_properties(curr);
+	if (ret)
+		return ret;
+
+	fwnode_for_each_child_node_scoped(curr, child) {
+		ret = gpio_shared_fwnode_traverse(child);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-#else
+
 static int gpio_shared_of_scan(void)
 {
+#if IS_ENABLED(CONFIG_OF)
+	if (of_root)
+		return gpio_shared_fwnode_traverse(of_fwnode_handle(of_root));
+#endif
+
 	return 0;
 }
-#endif /* CONFIG_OF */
 
 static void gpio_shared_adev_release(struct device *dev)
 {

-- 
2.47.3

