Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801069;
	b=VgJmXf84kMf114qunCD9kOl3y+Io3bGoGJfii8l/I7rDI9xrOkVWAS26JtDs4pcSu1hz
	 7tolCZsZnGdE++9uxhO3nGie0SgHyEiSwAhTiP8xXPow231PewhLWWnPnzVlxlddwCPUB
	 9PdUAq0xm7KaxtVqFtQoKXsygJZbjxxOqeXUYcEq3J1Ih3sBnTbrG6touGpaTRf1Uo/kx
	 IC/XFKDYjooWosRgNxeVdfUg347A6rBFVUiB52Gn4UQt/RM6gdRWlZYcPhH8VTDq4T/Z5
	 mbN/4+K3UnxA3fTNClJn3aD1OPKOCrR8ALT0Elw4WgRDHLjkidf0JdlM1WAp9j0hLSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZgobOhtontorZ2pq2CxeDs1GIpG9HQNMeP3oI+kiGTQ=;
	b=x9YxukBknCbvWiHq3bi7MMC0D0uLQ0qD0jk+JHOWqsyBr04gGXiGAwpuYc/w1CFKNqlg
	 Z/OMTEkMW3CyZNYtHSX20wC5tY+AhqEWfL6i7aXDWOV+kZlRQQH6TrOcoUuaFM7oiUBiV
	 0oJI6yWx5E4txi0SbwttJD1PyvEKEBWbNXLuE7gLAl/IoXKimOO88dXjaTbYB8mRLbpLQ
	 RpWnE8bgN/rjkHp0z7Ya5pVajMAQuSWoQllwVAUR0ty6+dCHYtUetpcGiGGDDDezy9v37
	 kmH54wabcmgv1+CeqWyvFC6bLTJjKoCspY7dZhX0xuG+GnEiGUopsCTEESwyGiQO+NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iYUyoyJu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gG1oWqpx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E53F606A333
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E53F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iYUyoyJu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gG1oWqpx
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZxJj739289
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 14:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZgobOhtontorZ2pq2CxeDs1GIpG9HQNMeP3oI+kiGTQ=; b=iYUyoyJuiQwRJsbp
	5RVFE5IXsOYEAjo9SwTRE/M946D1jDm83M0FZjkydlbWU7LxJWqsSBrxFbezakjh
	ZFPFFGn8l4ZUHWAVkPJoDGx3YDTdIVEerLUENbcrGidX4fpkFzyCczCf0f3wUG2H
	+blQowr4Aft7z245G3WSyLL3NCPpeu+S7dYryFGgI6up5td95qDccYOMLsBJXL3k
	Mrv1+5+RloSWu0fj77QhVmB7xRdgBSU/G0SFR+Ywcnrwlpm9FocLiEk6XQkSdVih
	99+yLY5fssMWCwuM9m/kT/MXqms16ray3QXpOft9x0pS5te8at7PtnKIKPvWBCGv
	2eDrMQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163hahe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:04:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac76132001so663992a91.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801068; x=1794405868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgobOhtontorZ2pq2CxeDs1GIpG9HQNMeP3oI+kiGTQ=;
        b=gG1oWqpxRbwKGCOOsEGrk1KBueibYRJUFnR7SnuA/nbfaC1ycW8j+TnWNux3L8ultX
         zyfP4vwjhvyzD0S3QyPE28zuqI8/omUhVZ/hEsduQdlS2wayPTCijCA/eWn8ox6i22uM
         nWjPEvprj/0I5NJ+e/t+ufPrOKQNhjrflim5+YqNAyNoN4OVI/ulxJZ2/oHRwrMkBGB/
         YpyVBtUt6Hbw6jhl3XAuDi7LNeJxX7+DZg7ur1WweenQi33ZHoeYk+rRv15d9FeHBu89
         QygB3xZy1mk+rATbDgRkr8/dwbVDAlSzp6uAvj7CifYbEzHpm5yk1BKH8VmFctbTmJql
         BJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801068; x=1794405868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgobOhtontorZ2pq2CxeDs1GIpG9HQNMeP3oI+kiGTQ=;
        b=IV1XrPI0oUmtT18uLA49UvdWqpyYiLae3t1oWLdEMaiYP5g6hF9MEbNB//5Mr4zXof
         K3RVVj5FuATEVugl3ODnwqxLUJOdJyUbAVQgMwgx3UrmUn0LxhI7HySNbEqoT5gsb+xt
         2dS5mUoDE0hNo1p19MpMBP3mz8i11qA3i3ulgwLcbow6eaQI6F7qGvqlex0oz5ekPE1u
         CcKaGrk7qFsd4eg8JZQiKLstViPLnVCB23fFA5UU/OYbGsQXfk1IulvVgeIEpsp0e3kk
         wYhpCAHx8EuzLAK7Wl0CtTm+32sT70/nl/UX5z57z2I62RxiHy37wpqWLl0/eisoCZrR
         RCyw==
X-Forwarded-Encrypted: i=1; AKwUvBz3i53BocCH+zD2YTlwtRiht24X4gQlGa2TkX4kHy/rxxYvtHXMolt2axC6indxRQMPZCGixFFDY9px@vger.kernel.org
X-Gm-Message-State: APuU4Z8n+Cglo4EvGqJ8dRe8lZo5a92gJXoC7Eij1olbu2KmV3q0VUP8
	9kQwXsWbvLW+4UV0aKAeUURBuqCmbbSPRF4Es5KwrL6fvdmtc0N7JpYBA4j2rstF0WRSj7EjUE+
	mS+czadyWFlznroMIBO+EM3hQDkBQKMWpbs+SkcoL0kfrRQeRZk7y4FX6stI+07QJ
X-Gm-Gg: AYBFou2CXEC774uqBPrOCEa4YCU0QJXe8apoC1muMRezDOlRwWySWJiL39ncdrRSRfE
	wCwU2tNRS3WsSIgsaCZ/zLl9LmJMWxFLO+RULSc+9tB/u17XUszPAZxAfXF1l6epcxMg9/A1K3z
	3+AmOe1KIFxVDfo0S7D1bwLWM4rHiwQc0w+CrYhEoffrc3n8i8L4S4Ax5iDxNgAmMjRjuA89RBp
	ShrDxWLWFUaQx+XRcJZgInSstjhDMrHNxjU8pwsfrzbiuyMu4EXKZ8CSnKA3AgeyYXPEPHarkoc
	Y+EJouXbwKayC4GlX0sSxvZGap3NCKv/VTFdggRBAW87S2pw1TRN1lm91jW31RipQRpriavkDMA
	hlcYdhy8Ohv0CUlr5aK4xhP1X0j/LyLNW/zr/RerW4kb0msVcokop2VDD0n1CkGprZxi0RwmCBT
	CTGw==
X-Received: by 2002:a17:90b:5404:b0:3ae:6fda:78ab with SMTP id 98e67ed59e1d1-3ae897b2faemr13065955a91.25.1793801067879;
        Wed, 04 Nov 2026 06:04:27 -0800 (PST)
X-Received: by 2002:a17:90b:5404:b0:3ae:6fda:78ab with SMTP id 98e67ed59e1d1-3ae897b2faemr13065923a91.25.1793801067284;
        Wed, 04 Nov 2026 06:04:27 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:46 +0100
Subject: [PATCH 4/9] device property: provide fwnode_property_get_names()
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
Message-Id: <20261104-fwnode-for-each-prop-v1-4-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4183;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lG8u4PIsCMTP6/OBe/nUeQSvjl34mplBvOKl1pwIENY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSziKanUDnlHyvs9zq52h5J61v9ZBZ8J0Zb
 NwObdrJMNuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w1ThD/9Bt9/pB5W4AqgfwIdgypVhlWdW8dpRpiy5dpgHgDxwkdJA4iSAbdyhY2QFGf12dhnY+Tt
 9n2L/4dZ7bhPL2SmXPpSmE5kDmnj6YMti7V/gDASRHIIoMbMXn3DZtThDYYHJINGaQOYz/SzPM7
 Uqh25EM1qMvv0Q74XjT6MXta65TF38LeB2GnP3ykvoTtyiQK85LSgGRFmqtV5sZEuEiDEpOc89D
 i87EAjCGBhs6Sr6ExRkR/mb2A3wrz9nBztd/BmdLN5OuWQ7ejmCy1EjoySylxHIYS88bKUmGPTM
 yoXcWsMAGl0ws55+6eBxExUHBAOrMEAjMXr0DzplqdidkQxGx838od1plKS191dt8B++AigxLb5
 74aUVIwT+f4ocCUfWTgY862ZifBgDXXa0WLdzhS4WLs6flYgvFeEgTvg3vLjsstOQrCDi0VQqur
 BQBy1YYcXOxaaGdnoDZJe9uVzPLsTv5sWRSYNLmnodZHk78xy7pxslnDI/sJNdfq2x4zsOJ/AIL
 789GXZVwFrZRaZt9GlKOC7QS3KukBJCyyx72MrborI1ox1Onn+HbG4yPj7Df0XdyRAqUi7dWrep
 r1ta5bkDvUomwaODpuX4us5dBFt4L7wPQoMhl2eKFh5q+b1UmpxTs2SntFtlpJ6JEekbZLsP14V
 SqhkBkYXBCjJtuQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: LBj7Q39X95G05LEkR1-vkINeM5JQ6PyR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX5MSzlhMpS3rk
 SPHuggOTqCFV68Nydrl9IvyUtKtrUqgZCInmabqZExWzZWXqRqvvzvIVxoOBsTGZ+u0Mbn3lcZ5
 KQf5JT0YP/TNUz4t9088bOngU8Los8o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX82HtCWzXeqBg
 W+JFY9RvecLEH+ovinFt0xCLw89ronnjtbdTGEVKzH+qIQyihsYhGzdTg4kF4AJrVNmWyL/DH4P
 ShhjqiurezEsHsslrx9vwYz8qUr8yDLv4F498NaNSgjso1jFz7IgO3KBIjACeVys81QAdOUaE2m
 7GxESzzhdcYaXUal3mJTd7SXvkscXV6uhcw+KOw/xuHq48zFA9jUDGSqEsmGspnIMn5owZQ46Xt
 9jzbrcGNByIxKMH1J/g7SX3Wh1bRc406Rv9JLJmgMhw+Pjut+4MSgl944hBkr/yKh03liM6h7FG
 FXvNWeXDoI4B/9CpxvhceWrK2RA+X8kBktkjSmEtcPcFHJj3DEeHoSzXYJ9pFbmUZKRYobX5qnj
 vGEO+sa5wwebbK/iohFlDgT/HfKxhZkle/ialhEnM8PMhPwbLQCzi+40fB7UNcnAG/CP3T+WUB+
 ljVX3L4pCFBAZhWwdHg==
X-Proofpoint-GUID: LBj7Q39X95G05LEkR1-vkINeM5JQ6PyR
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb3b6c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=TWYznOrfPw-dbyUB65UA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

Provide fwnode_property_get_names() - a new fwnode function that allows
callers to retrieve the list of all properties of given firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c  | 77 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/property.h |  1 +
 2 files changed, 78 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index a97575ff9199004b4f401f432aed6c95e40d0c25..7b0df3dfae53b6377dba91330aac746684e8adec 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -11,11 +11,13 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/minmax.h>
 #include <linux/of.h>
 #include <linux/property.h>
 #include <linux/phy.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <linux/types.h>
 
 struct fwnode_handle *__dev_fwnode(struct device *dev)
@@ -542,6 +544,81 @@ int fwnode_property_match_string(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_property_match_string);
 
+/**
+ * fwnode_property_get_names - get the list of all properties of this fwnode
+ * @fwnode: Firmware node to get the list of properties for
+ * @props: Pointer to an array of strings. It will contain the address of the
+ *	   string list containing the property names.
+ *
+ * Return: Number of property names written into *props. If > 0, the caller must
+ *	   free the array with kfree_strarray(). *props is only valid for
+ *	   a positive return value.
+ *	   %-EINVAL if arguments are not valid
+ *	   %-ENXIO if no suitable firmware interface is present
+ *	   %-ENOMEM if memory allocation failed
+ *
+ * The list also includes the properties of the secondary firmware node, if
+ * any. Properties present in both nodes are listed once.
+ */
+int fwnode_property_get_names(const struct fwnode_handle *fwnode, char ***props)
+{
+	int ret1, ret2 = -ENXIO, n1, n2, i, j, count;
+	char **prim = NULL, **sec = NULL, **merged;
+
+	if (IS_ERR_OR_NULL(fwnode))
+		return -EINVAL;
+
+	ret1 = fwnode_call_int_op(fwnode, property_get_names, &prim);
+	if (!IS_ERR_OR_NULL(fwnode->secondary))
+		ret2 = fwnode_call_int_op(fwnode->secondary, property_get_names, &sec);
+
+	if (ret1 == -ENXIO && ret2 == -ENXIO)
+		return -ENXIO;
+
+	n1 = max(ret1, 0);
+	n2 = max(ret2, 0);
+
+	CLASS(strarray, prim_props)(prim, n1);
+	CLASS(strarray, sec_props)(sec, n2);
+
+	if (ret1 < 0 && ret1 != -ENXIO)
+		return ret1;
+
+	if (ret2 < 0 && ret2 != -ENXIO)
+		return ret2;
+
+	if (n1 == 0 && n2 == 0)
+		return 0;
+
+	merged = kcalloc(n1 + n2, sizeof(*merged), GFP_KERNEL);
+	if (!merged)
+		return -ENOMEM;
+
+	/* The strings are now owned by merged, only free the container. */
+	for (i = 0; i < n1; i++) {
+		merged[i] = prim_props.array[i];
+		prim_props.array[i] = NULL;
+	}
+	count = n1;
+
+	/* Properties from the primary node take precedence. */
+	for (i = 0; i < n2; i++) {
+		for (j = 0; j < n1; j++) {
+			if (!strcmp(merged[j], sec_props.array[i]))
+				break;
+		}
+
+		if (j >= n1) {
+			merged[count++] = sec_props.array[i];
+			sec_props.array[i] = NULL;
+		}
+	}
+
+	*props = merged;
+	return count;
+}
+EXPORT_SYMBOL_GPL(fwnode_property_get_names);
+
 /**
  * fwnode_property_match_property_string - find a property string value in an array and return index
  * @fwnode: Firmware node to get the property of
diff --git a/include/linux/property.h b/include/linux/property.h
index 9143fe4f5c05179e595ba875aafbcb006a740824..a70f3c4c087dd85390951da950c3632f89c6cfd1 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -77,6 +77,7 @@ int fwnode_property_read_string(const struct fwnode_handle *fwnode,
 				const char *propname, const char **val);
 int fwnode_property_match_string(const struct fwnode_handle *fwnode,
 				 const char *propname, const char *string);
+int fwnode_property_get_names(const struct fwnode_handle *fwnode, char ***props);
 
 bool fwnode_device_is_available(const struct fwnode_handle *fwnode);
 

-- 
2.47.3

