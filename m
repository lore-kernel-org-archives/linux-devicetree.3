Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801051;
	b=41/il2svWqs+mVBD73cjaW/yoIsJnry382eXJp9uUMnOHN8Hz27u0kz9by5CHa23NXK2
	 AfIEq1KGji5Kv/on4O8v75dZJ4cwNDWaM8CsWCwcAgZ3TQOgKKMSfp4PEoG79tcY9L/dj
	 bwWPZWdULF36ZWo7P9HTnxRi4PGjnjct6CN7ToJ/ordJOBclYj+M2l52AfEdqp6L9Hxor
	 502/gS+XTzZhBLWa4GloWfh9nw6JPCRzqOZAVzBHh9vDoNWdYBYGb47CBYFnzu3xnS6Tx
	 gZaK4lMpk9bWyJl29U7pZZ3H+4SBzosYjjIVfTt7jXYJQMU992s3E30+aNoHh9laAmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801051;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=;
	b=lDAAM6fOaxJNSUTWKSv+zTApGG29sNVqM/vYUt3JqasbOWqD3BxfOw+5tDO+W7B5jsdu
	 w5edwoRvAmni4YCr+9b5EFKuLCkZIeWMYxY/JteL7Nv/geOHjmkeoUnI8EoRrM/yPj3Je
	 WZqUoWp2h5T2RTWgoxOjTGcPQHz4effQ10f3fwADnOhGZvklZWToIkjXIvx3V1fjm9Mv0
	 fUM64cVb5/wbYO0jo+PzGpq1Sm4I4l97UHZ3Rm7xOQwQbR10BJtZnFIn9WCq/GKGI/+DW
	 szY0E/6PQzn4Mn1y+6g5Q+Hq/loqytcQVMLIlU398cScoYisgn3Pwo0q9a7oHdmQx7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hUrJSP0M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TH+gPYn3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6657606A339
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6657606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hUrJSP0M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TH+gPYn3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZnjR739128
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 14:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=; b=hUrJSP0Mt8gOwM89
	5KbD6f1dJANQXZnFSR2CcGYiV3U7yoRkZhd1NTf0ix8a+F5TXzpgjSDBq7yCUqw0
	GAMse+xcJdgSfPtL4CqWLceUFzTW48Gegyvj9VZJRBu4eWz8QZHrny9HV/AARVZC
	Jdqzp+ya2b2KmUaiZhPm9RNgccFgI/9QAqZS0YvuOif9nxZJUP4zw9niVCspry4X
	eQAQaird7ZE8wsa2OhzgUH8gslTW/92WrZBgUo9M8l3CpI60Hw6l/yrplW4KL/M+
	2O2K0vYLXBkErIh1/qG/G/z8MJ94F4n4n+hBxyqV0imU1U24j/nT+CyLmbc2tE61
	cyQWEA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163hag2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:04:10 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eacc615f73so624930e0c.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801049; x=1794405849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=;
        b=TH+gPYn39HTVeHEBvKfIFgktoz5xnOexU4GXz67Sc8Reh6CpompYlkMNg0dspiZU5A
         MyzgJ3xsqEIepUOcfvuK0e7k9fzluUauUdUGNI32bc+kvk6V8l2KDEccr3tqaUyHvvio
         YuXHnJdszwu0FL3+qv8+tjLRlqyuKuBtfRGNu6zbGb9GStA08eb26bTSA4zLGEAUbn0y
         vW8xjvw6oSLmqJrujZOx+VOmPpti5QPnpshM/BmK3DMWV9u7sXL9OUSvoWUwuoRYFc9f
         /pl4mPyAw9mmElCBpnv9IQop2sjEp9Pucwo8fjww2O8jTBJXVtBozMeNRTlfjQdu9ubi
         yG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801049; x=1794405849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=;
        b=qsQpSBEJKf2dAJ2UCezxuPX78MNzoISP/S/yhqxALTASZ6Vzt7yvLU5Rm4mcvK5yBa
         Iko3Xa7lX5genZAAMYIBzMyM8VpH/FQRgp6AZsKmwy5yD0nHXG6B9gJXaEpGTwFvbSN5
         gwVHue9vx3M+4JOXxBESRAL9a1qBGfzqzxxaECefygOz02NyNN+GJGvFE+Qtb7dPCJ4d
         YufMnKrgbr/fQd+cWBfX3uL8xE34I5ysbXiqYqQhCsfOroF2KCmeZA96Wg9pR5uXJsOp
         YOuQH3ka4nztd/M0jMgkOPenotgVD7UEmn+aHMpwazwGCZKaBNWqtuz50DwPqjjRt1Sx
         efhw==
X-Forwarded-Encrypted: i=1; AKwUvBxJREIs0kZm84DoB+DdmEwjUcJ8XsDveqKm1gyjfQvM6rBex9PFKdSM1ZYghudtBZCtU9CEwMw6lp++@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z5rNalAe9paEQMWCpWL0nwGkgoA2IEA/K9lqjg/logu3jzVRC
	rHUfWAgtqWx6SAVHNUvG4ZGzqOvNnhmBP7uyWXwh23T8f6cq4dJhkqZFXgo6UlGTRnculZ+p/3B
	AVjFiSSB87cU/3DKJJkxDcZGcESmTP44cUQRkmApUCYxJ77VQLVDr/GWoYZNi1X09
X-Gm-Gg: AYBFou17oRR0O6zRyCR3FQQwjqvgQB3ULtaAsCIOJ9prR/vSu4Dror4xuojvm7usjJ0
	mBiqEqJTDAstlbBIfarkISsSz5R24z8EAvX1hpiAXF5eyr01dq1tgbtNtxmWTDUd2L8c+6Bqu1y
	XvgiQIhlWQXLXc0WoSTfMBl+nQIfvj2tHnkkrXNzVvM7buGm3GRL4vQ0u6jK2uG1YInATY+uy2W
	Qwf7G3Gihu8MG7AEInKZTEY8QtQHlzkMRo+qK8It4AnrOnmFYNhowOsrwe1WRLn43jmxH/4002k
	BiwGLXcIorR/PLuwZqcPEW6gCKN3IkC4fZhreG/AeVoj8PIrlz1Nv2243wekpoiThSkUlfunweZ
	WPsIdOu6ycax9gK/e8UaiBH7wFrcvX4swtbu2IKO/DPcq2TPB5sE1itvre7biTbbjpiYYtzVDcX
	j4ow==
X-Received: by 2002:a05:6122:6081:b0:5ea:c6c8:7985 with SMTP id 71dfb90a1353d-5ec6851faaamr7134465e0c.3.1793801048568;
        Wed, 04 Nov 2026 06:04:08 -0800 (PST)
X-Received: by 2002:a05:6122:6081:b0:5ea:c6c8:7985 with SMTP id 71dfb90a1353d-5ec6851faaamr7134392e0c.3.1793801047851;
        Wed, 04 Nov 2026 06:04:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:43 +0100
Subject: [PATCH 1/9] device property: fix fwnode_name_eq() for empty node
 names
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
Message-Id: <20261104-fwnode-for-each-prop-v1-1-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=R5+4YFOhCFZOKo/xPA+jYi8jqwmw0oVnYVkmsrZp3qo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztR2VZRR8SSzbH/fsbXq5OEdxvsguiNVfCLx
 Ww5wWSa7BCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UQAKCRAFnS7L/zaE
 w5PBD/980NX1kpJDXHWY0ehLFm7ONkPKAuH/9fpNf1NS3nxrcWUQisefHOE7Rtk/myleJL9pvTZ
 YMTEJgUAddIze2s4CfeWGuQ8XZFF7XDUVZUbEbOtrLh48sNh7UZGAGdmdk0hiu2lX4cpQgRYCSK
 uW+Wi36cN5USM/zBa6uHoUVU16ijpbYdu/5buK2ZDpIuGVch9S4Cdi3QYTY4GuX5TTABbhDhMFv
 7DEAV9ZrMrQ7dAL2gqjtxufFE2m9E4dVq/OPbCMJd4uGCAFlbesp6DVR74ibKRP8u3vU2ZR0Y5p
 9IoMSuYhDCzsg34QdjJIKo6DlnCAH69Bv8z8luC+IjDAhxjCkB/BiSaU5R9/mq+7N+8UjeaIhqA
 GBwQmXvGVSyPqZkUseXbxJRz1zqT44o2PPn4T3Yac1vkXS0a2/FttiXRtpq0Yeuavow36rpt+Y5
 6/jgqc5sChJIQi1fUCFZZZtM45m46b9Zg9iVvaHk5deuUjR8W9Mrepc5mmFJKzrcaiPf0uy/cDO
 K157bZ32oblK2TKDNhw3Vsw3q/WsJ0zudQpSEB5tTuopcYARa1H0I7e/v/UnvXs8HYQ2tMzx9k0
 aT+SQXgewV42y6g5n3wfSwcX2GBztUDAy2y5NR7b3xRzlyDSGDM6IpzefrlsoUKH4riVfSSPn1q
 dT7ZIUbHUkPawWQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 5HHNP5jR_jp3LIO1EL9_c32p3V0dXavu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX7ICqgqmK2N1D
 vzW7zm1MjfEyGu80V0gVDHDOuGxdATXBIH0ELZF45f1aJb7yeD7Bf1UwGo2qD3AFsdr5s6r3l7Q
 zMqI0699953UMJfz1QpuKnVwAfu9mRo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXwd63IuX0uvaG
 URW5C/mqQdhBNkiQo36AIzFWraGwrpiNcKfsAqVkcXToYZxTZkw5BlZ9rOuvBNk8yDxfERrXbLX
 y+uquCsWzDj0/4zk9cP/bBTKkV2h8wpJq59wKG2kPZ0m9ywPxR+b+0HyOdSx0ovPcsTih/WGUeG
 43bXBlufX6K5r/pac6gyiFYvl1m84Dr9mFqafSnHDUKK8teZCAaBirRAUkgxRQRBWi1a7kal3Xk
 ZcvUXWqL1S0vLEJk0eUHvNCAKx8FIYhpJ7lfaV5xn5wiLTQg40kSxA3Pho8HEyEGTKb3ce0/qce
 J218Q2h6kis+QMKQ1Pmml7AWLNu5wPKRjWHUChug23iwF5ynVpfHTE0dZ12g0aNv87erIYdd01/
 qXnruG+9EN4mUVnirYE5JLejcpYGvblOu37v3LB2gwORL3Js7koDE5DRH+/c08UZaIfmg0i1+94
 poG21wtNHh3qrWFUR0w==
X-Proofpoint-GUID: 5HHNP5jR_jp3LIO1EL9_c32p3V0dXavu
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb3b5a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=bz9ZealoQtrIp7hKp04A:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

str_has_prefix() returns the prefix length on match and 0 on mismatch,
so the mistmatch case can't be told from "empty prefix matched an empty
string". For instance: the OF root node's name as returned by
fwnode_get_name() is "" and will return 0 for any name matched against
it and since len is 0 too, fwnode_name_eq() will return true.

Do what OF code already does in of_node_name_eq(): check if the length
of the expected name matches the length of the actual node name before
comparing it.

Fixes: a9c8c738066b ("device property: Add fwnode_name_eq()")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 51109794d7275ddaf4571584d0e77d8573ebb475..a97575ff9199004b4f401f432aed6c95e40d0c25 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -700,7 +700,7 @@ bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name)
 
 	len = strchrnul(node_name, '@') - node_name;
 
-	return str_has_prefix(node_name, name) == len;
+	return len == strlen(name) && !strncmp(node_name, name, len);
 }
 EXPORT_SYMBOL_GPL(fwnode_name_eq);
 

-- 
2.47.3

