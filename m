Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801077;
	b=cQRd0PvYPZ2RAUkyzaV7yOmj3MdAHJLBoRha/ZdO0nYyLOvHKWE3aLtT07fYrW9XOakn
	 nGkKuY76EDEYk2Jj6mVagjLbNtMSe2uj3XDaKzogGIRr7ophIAFCI26UdDVqrQpMx4aD0
	 kfNVR+I33yXCjrvVU15SGtgz0VjMcWW6Ju6+4BEsqcNfwbP2VwtI5uaXZxPdxcfqV7gk/
	 5xgf7W7K0SYI0WOfF3zNW9fdXWz7QK0xcRoVsSvB+B5A6UepmWMsYnt73fg86v//Jqc48
	 3nN/Z0gmlyYLPF9JNN+5UX1vtSLPSkVuo+JC3uw4NDRPN6Xx4D+tm0GV6HjKxQKBl2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=;
	b=l8d9CYa01hIdjXm9IG9Imvi9FKWNmM7aHQ5D4q5vppeKz+YG31c+fsKnWm5u2O7/oCUn
	 3Bb01ayTqokPIeobmI4pidFFmWPB8u3by+8dFxk0JfimTLLhEcgkTTDmIbUTVywY71ESr
	 ejQuMhLcEtefSuiZVxcIqq2CruMb2MGrISK0vTulggc3kkUOiQZweAuQWceQvqWjtHaUP
	 zFs3jO4FPF1PZZ0rl4LY8LKn8tUOWOa3AfZnp6V7hYn7iaigLJEw0CjoHqYzO/y5UvTqg
	 TFYMLtmFXi2Cj/JUaeABGodhjWUxkkBm02Ee6c5GsWrWpsMpXA4kGSUKkhQEU6YprIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gchuXv8r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iOq2hzB8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C375F606A338
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C375F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gchuXv8r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iOq2hzB8
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba3sU119598
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 14:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=; b=gchuXv8rO9edzX4k
	9qDs7/iWqeOWA9XHdem3GvBvH613UiaHaQ4a2k3XuXl0vIk2+z09HP4L/ognem5D
	o8Xeue245re7R3yoKngvcRV1YcDMWvbWNF0j91pIJcumHa1wM5ODziKFoYFMiK/8
	LkzX1OmeefktfarLz+A3xY+nQHY9sso7EDRd78jzV9nFvR1jnURHIoqeQmARzK54
	FdbhvYqw1u3Hm9ieKzdPIG5R/+p0lkJvYxz+IwcBGWEGX1Puvd5Gm2oBaFfTuVD+
	GNRE9SLfjmKan6B8yCaF1PRHfhleWIBYdcklOPmFFvxKxK72c7zxHR7WUaRjrgzj
	dVO8yw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb0aar7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:04:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eab0467c89so810709e0c.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801075; x=1794405875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=;
        b=iOq2hzB8ZIzAL0kATvijGaEyYH0ZXJ2EDRzy8FmBZhpsc3H5Nn+KlJb5Fxynl4CTVJ
         aCMoRE3jkUNa1MGQU66Yc8TZDSMILHk4oLNWsAP9C/ZYOmAi94VgUQjPboNwcLoLKA/+
         ysPF2FPbR1FwvEp4zFRJS6xIFkD5v2uMsVVjmUK0KNy4JtnrHz/hVboOYkRugEdhJD6u
         nHSMTLFqhksHYOehdjfFGEVvuYoC9me4jUoD9MUdTsUZyPSw86b78uRO/81c9I5/wKWP
         4fNUmfxX26nasD3GupuU6GkKWyiM7XygbkK6dIDm4DaKrBKZWvIWqVszAuoo0y+I/UAr
         0cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801075; x=1794405875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PXoe//bTeecJyPl555OIdQFJCsZxAnIbYF6rirmpkk=;
        b=DjJdi6LsQwJp9BI1oPS3Zl+wwY9sBzBnGBBUsg9LSMH+mBVXzUdI9NDTVd24hDCGxs
         842+t5NsX1CWsB6XgFhZbzO//plPoPuMaG/vO9ooCvBhGPLSb+rFSfzsViskcxuXV+bL
         8sbSOGBC/DDtXHdYUbtki0bAZ9veTMau6E/dcGlhCRP7WKwSaHAkIHKw+JZzSWjbGXcx
         /7S4KWfGWaFWTYjWbS+dtooBeQxmj1OKnhZ32MHTR3y7hXXYONLCmLGQwURRT90JSRfi
         4Qkp42/Sr5wWa6nGWT30GdNHjXGPnBlZIXxs3OJbG2pj9lODCyPjZsD1ZkzAa/78cd7M
         u3jQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwGV/cc9oIs8JkXQQEPuXQ7+T6+/JYockQ8JxZCz+dGJDaTYbIJq3IIWpw7WlmLncrA3psLwx7bSG3@vger.kernel.org
X-Gm-Message-State: APuU4Z+ehGjMNyG9/72rSCWkwhRGTgbaB6EdGBGdXpfYpwLDGK7z2NPz
	ZcF2sWr+21m5zrkfMBBnfk1ZXUU9LRxxcn/eJrCjYXUozH55MuR/9+srl4IreSNrHyDa7L1LTyj
	ezG5+c57z0yf22zdUBx3tgdiSOO1IqFIKjY+vIjI5i+UyMtRGF+cexoC3EIxkwUaw
X-Gm-Gg: AYBFou0Ui2NQY6ufjPvH0E3NEORGinmvUmtPapM7dVbf6gtxemPL+BP9MpjKoDFF2/r
	EjrU4c7uf8BI+OO6yzzfYsJpOdpk6a6ncBeApRw0rhHHCnFoGCfoU7anWntVYMRHYT5YEVNNcYG
	f4WfoM4BdCTzcoHwsUol+z+GltG5khZob7y3sjbCHiWFXEZHElLVTwY9K09ZwCorIfaydVQeJGR
	pb6sL1sNVND4vONaupSYoh79wN2NkFrmyDuK1OqF36j6U0oQ+rNvIpZwPKJUTty0+x2jKn5xQvd
	XPe0IjrxJZv/tpHA6kDfFPZs+eGbNPyaVB8g4xHe0Q1FX4k+AndNMijdRQhk4/s/P/WOIQ+5hkN
	5sYoqFe9l8W1n70ipI8stXch9WMCLebgIQTKYW8a06RIgyNCTFdivvbEWzYP5DKCEX9e8wMwTCs
	PXUw==
X-Received: by 2002:a05:6122:1b05:b0:5ea:cd69:7cda with SMTP id 71dfb90a1353d-5ec6895329amr7314497e0c.7.1793801075075;
        Wed, 04 Nov 2026 06:04:35 -0800 (PST)
X-Received: by 2002:a05:6122:1b05:b0:5ea:cd69:7cda with SMTP id 71dfb90a1353d-5ec6895329amr7314419e0c.7.1793801074572;
        Wed, 04 Nov 2026 06:04:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:49 +0100
Subject: [PATCH 7/9] device property: provide
 fwnode_property_count_references()
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
Message-Id: <20261104-fwnode-for-each-prop-v1-7-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8CscP3j7PWUDfKaYGcKxatd6g2T25BK7kN4l1KEUd28=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSs2vnFhnUytszIj7K0MWGPjj4eH7eynMe/
 zjl1O2hEWCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 wxbqD/9x7yrGNGnGGwHE/5F84SboRgKxOd9v7VsB83upksyfCmrNUJdCvj8btxeeA9qzgCSClcD
 T2+FVNnhuq+bimeEhLsXJVc5Mj/CfnYLlLf2HjYTBw5XKhY77RyYO3/zL0ion/h+N/o3GU/Lhma
 VF8h2/k11CBVzYr1/hKVcN2UC5jnTB2dHJyx6lZhWY/gjBebAny99BGE6EyfNNQLD+HHJFgqtX/
 C0uKfmTKduexOOQX36t60DS2U2psmBug0DC+dc4AXDLq3lbfkgndojubKYsuBF0p+/D1sDt0zI0
 ZIruV+1C+7YdqLbPhKHvqcweY6qAQoQn6IFFQnJJD819mEy47NLuqS0pL+SfoZdF7UpNz8G0FrK
 fdryDWH7y14b0ytPPljq6G0ngevcTwf7meR0wMlSLH/HWzp0doxh1r45gpfIzbU1Sg//kXPHGMH
 iGn8BXYBDykkG/EysgPwId5ZbrCICEEpOUVEi0CaqYpNfiLGCvLIht1Jwmhp4NgoesgamhlX8ch
 UWI331eV85JS8aVnHQMp9Qd4WdJlUN7LCUSDkEwzGKUa341ySKsI7OzA4xdmVhWtsUoLSCMGjQe
 aNX0J13UCtBnpMjdzB/6iszkDHGi5e0UDr1TJjXcQAMUb5v/Aw9JnI15RStkZJ+fAr6N012X6iK
 zmmFwOT8akGpUaA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfX/16x8r+dd+S4
 krH2xAAjKN4Po3xDEd5Jb03+Dgc6J15IvX34Pyr/GXe+G9vPkqxhIz5+/91SwsICaCxy8iO+m8P
 0LjZOnW6WrcQiMofw8cgERwqGosV2/s=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeb3b74 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=SSMJkwzw4Xnz0fcc0q0A:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 2uT4fLUFC_PQihKgWM1GFblDmV4nD8u6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfX+in+A9hmh0Uv
 aPSdX72VmCOvzoDjdjRxuXE1VStzyXJPleDjMjMCgF6yyeYBPtrGnuRwbxKXWgr4508iJ0efkLd
 NpHbGDSIFI1VrdJ3xEnBPeoF25/xsB0qGIvhH3Z2Bk8Q8K/fH9OFMtLIn2UkSVb/G7FsSNRO9Qm
 vUFiWhWYh7KQmepc/gViI4r6i18GIf9u21v9Nm4tAsKniclsOIj4dxbSFrSMyjLse5GDOSvR/+9
 lJ6k1Lw4mZR2tRhFnrgUhDRj/JOu7lqQ50CLFjg/oz0WJBqascarkdyl0yz9RUjPn5a8WBzS59n
 lGd1GZTFBAeeufiomywlePAOHFUrMngpRcQVZTBDQWyhr6e5YtNtsjxPwUF64oAVwOJg41VDWM9
 fQFqlMlEij7+G+qwitS/wNOI+GWNtI6xBGw1RVeYScqlRPRMH6pqEtcn0g/+sOe4tzc2sJKjv1d
 Jr+odvfAvo+nB56BukA==
X-Proofpoint-ORIG-GUID: 2uT4fLUFC_PQihKgWM1GFblDmV4nD8u6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040056

Provide fwnode_property_count_references() - a new fwnode function that
allows callers to retrieve the number of references in given property.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/property.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 7b0df3dfae53b6377dba91330aac746684e8adec..259ecc4dc31a7b07e2ae5f53aa2424de54ba8236 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -654,6 +654,41 @@ int fwnode_property_match_property_string(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_property_match_property_string);
 
+/**
+ * fwnode_property_count_references() - Count the references in a property
+ * @fwnode:	Firmware node where to look for the property
+ * @prop:	The name of the property
+ * @nargs_prop:	The name of the property telling the number of arguments in the
+ *		referred node. NULL if the references have no arguments.
+ *
+ * Empty references count too, so every index in the range [0, count) can be
+ * passed to fwnode_property_get_reference_args(), which may still fail for
+ * empty entries.
+ *
+ * Return: Number of references on success,
+ *	   %-ENOENT if the property was not found,
+ *	   %-EINVAL on parse error.
+ */
+int fwnode_property_count_references(const struct fwnode_handle *fwnode,
+				     const char *prop, const char *nargs_prop)
+{
+	int ret;
+
+	if (IS_ERR_OR_NULL(fwnode))
+		return -ENOENT;
+
+	ret = fwnode_call_int_op(fwnode, count_references, prop, nargs_prop);
+	if (ret >= 0)
+		return ret;
+
+	if (IS_ERR_OR_NULL(fwnode->secondary))
+		return ret;
+
+	return fwnode_call_int_op(fwnode->secondary, count_references, prop,
+				  nargs_prop);
+}
+EXPORT_SYMBOL_GPL(fwnode_property_count_references);
+
 /**
  * fwnode_property_get_reference_args() - Find a reference with arguments
  * @fwnode:	Firmware node where to look for the reference
diff --git a/include/linux/property.h b/include/linux/property.h
index a70f3c4c087dd85390951da950c3632f89c6cfd1..9f0b9aab5920513cd468572fa96dbe3371609591 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -137,6 +137,9 @@ int device_property_match_property_string(const struct device *dev,
 	return fwnode_property_match_property_string(dev_fwnode(dev), propname, array, n);
 }
 
+int fwnode_property_count_references(const struct fwnode_handle *fwnode,
+				     const char *prop, const char *nargs_prop);
+
 int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
 				       const char *prop, const char *nargs_prop,
 				       unsigned int nargs, unsigned int index,

-- 
2.47.3

