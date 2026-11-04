Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801065;
	b=CulDxun+D5l0vyweRbBEODi7cxB2TJ7PGO7m9OgEzmaazHW/OdCLPle70ZGo5IPfVnyn
	 KArF73QO1eIHQdvHnIuCl4f6GQRd8by5dbV41IqHrr3Akyw64L1Hv8PXtOIj56h6qvilz
	 OszPxAiXgf2ZQAeMjiVPXky9qKRSQ47bwbdOzkYIvRFVbFBlFDNiZ08LhGtrQ6W83A/3F
	 d8bDZMNkGHiXidyOIYfYFENqCCGKPQcicwNWPiGF39izQ28EYsl0ykHGR/Mb8JUrI67ij
	 nFRqR8auDKc2D84jgyMcwQiK7ngt+W0SXHWlvRPLecOhOyuYZNFIlcw/pkVfmPwIB6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801065;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
	b=j1AjJFPUWw6qS6nRANPXl2yl6lx4cZU2bU2hHte6D25dC9ZhLd1ivITNUT7BnXvPEi9/
	 cfxs/orHu6ILNm0IOMnDdxzW+uSUQT5vSSGi7TVPiRfoqS1Y0tvGnKBbvh1LmJkP1v+37
	 4EFoXzOHmLuDlTz7Y524eg1n6qHXN0ZHnf2XcP4ZTLfEJi66OmoswtdRyLM2DQFe1NSuL
	 +Bz5ccREKXPWDK+/QfIbIJ82xq8OgpSokmflofp7AIJpCz7S2Ry8LBdo8THdV/sOz0vhk
	 pJAB3g/fMYMkYQtvOkpaxorFBqo3feLCwHBm5LlWz5MYfW4xgKrMOXG/Fx53VIHl8BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyMWzQsB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lw7Ijwjw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A07F606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A07F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyMWzQsB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lw7Ijwjw
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaHw1120092
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 14:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=; b=ZyMWzQsB8somTKQ4
	gMi3RoSQ0KBzQTZE959mdwa0DCr+eXsvWQEDJdWxLa7xLthPcip4E9US2RhNMUWO
	vPOamxpI7QvNV51/ZY8ZpCnK/10yZlknDsWdxAzy1J6UcIcgAivPuTHQK+lgPg5Q
	PhPIaSavgqP12V00C08tkIK3kBM7Td7NRc+pKl5bjpgs53iwESuA8GApOxK3Fo5f
	TH1Zqaglwa9JC2cChxqY4URyvZkKBs+gjb2u2M/2c/bNR5Gu5giyKwkGrAM3gRjt
	ZTWTtuVKqwXtUxboWAGuTMnYMAjgK7eApbNceCSHyq02GsYomazYmOBkFyUucd/H
	+4Az6Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb0aaqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:04:23 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ec2ea00c42so565493e0c.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801063; x=1794405863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=Lw7IjwjwbyDdLL1zDhlipkDiIL4B1UIHTWQypEGAmDbK9yCIoLEjpiaOqAbE3+P45N
         GS9rbn0Z/RM0g0xwqWXSLXpSgEOeXE4yIRmHlsw+WHoVvebQaH/bvCNE2nUKizWRDuH/
         +A4SG/xIoHOjgOiuGFUqKcAPUTh8+iIXleMxBb+eKxO22KDrONLgWnh6/4FoSxuyFDEi
         oiaCiuZqb7dvoAEo/ydU7oH58XoMhAys/CtjdSrjKBfY7Q9XaslinORWC9XINlxKpfJm
         TDzm4LYbkeP7qzkZNJjkGrPiJqgZTSnV23XAvI0wc1GuPWui+MAxhHBco+0szR1hk6DA
         I6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801063; x=1794405863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=Ze4yInL5C+YUWZ34HEDDTKO0PsFv9m/usrY2mjGGHl+j1zG5DOXpQ90IqqZnvaGOrX
         VrRncGl9SBP4ZbQlrpM/Gk6OEh5rxZAPfRBB2mcq1GxTikm7ENkFa71987YjY4cqSBKD
         kePBp/4tAPDG6pkZ8nXbWH3h70zwOxG34sbjVT4d6Q5C1nLflA1Fa3KV+YqlpjS8kIw+
         peMGWn8453JFgTZ8U4gk84inFHqZa7J1Jo4aFH07OYs6JdcdT4WrblxWhtNwqWrPgK1u
         V7bKgnl+oLnkOwHLE831hDc0sUxrdPcO566NIxQ3Zl8GTysqJjnFqEZdFSIJB/ohprBC
         bMIg==
X-Forwarded-Encrypted: i=1; AKwUvBwclGTaFyrDAbIAs3gfVfS/06g2DmEtKMTg53tUx0gTIfEzR3bEDPB2uyJlJiMxM9oM8Ou3upD5Q2Yp@vger.kernel.org
X-Gm-Message-State: APuU4Z8ldxdXXaJQEkNzD37LKvPBcthIZtg9EBKzn3X1uTIQg9nq6/sC
	wHOrYz7kR7XlxWYt1zJGL+nZvY0Rdj/zB7nyuoYb6EljM3tp5Oz7Ubt1QIYsrH9r1LP8q+Jfd+4
	vGmEOBSeOxIOA+cKdZrlKppg/A7zAx85iSxnqFsbR67RmN73yQh8KGW7cqjmQ/Or9
X-Gm-Gg: AYBFou1uOGnWs7EKtrH5okT0RlzF3emquW0zVy3fFfBX57nlDjFX3z2R1+yS0Jge3DX
	6T3jymk9vd3wCjmdZb9Wmh8Me1j2DzJ6eAIxBjCqyoI+jEOJf7r23UJaXcAoKSSSTNtCXCxfeHT
	5WKzZk6hhGQWCkS3TPyPOxwUEi63KV1c9JBBcA3IM6MhN/sfYSXYWMiQ2E+1kCle6SPQ3BF1HNs
	ZcoCTzSGgo1WSfmCFSRl8Mi5utigFzIjjUVm8nlZ9rV2HW2jsNrPHB5gFbmsspuXxjhRzZx0nU9
	ukIVnDWdEiHfSH/13EmcwoGS7bO4eL5i/+ectRnGm44GQhnnkp12y3aWYD3lx7TNh/ESDdF96eI
	87jkqIW7LuomE04sxOZAvj2suwf03RBu5gB/TqHg1M6cYr2zYL/GJIgYqUTKH7m7TGewpi2yNCT
	TAiw==
X-Received: by 2002:a05:6122:c155:b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ec5879d16dmr4306369e0c.15.1793801062960;
        Wed, 04 Nov 2026 06:04:22 -0800 (PST)
X-Received: by 2002:a05:6122:c155:b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ec5879d16dmr4306326e0c.15.1793801062468;
        Wed, 04 Nov 2026 06:04:22 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:45 +0100
Subject: [PATCH 3/9] fwnode: define the property_get_names() operation
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
Message-Id: <20261104-fwnode-for-each-prop-v1-3-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vlyXEW90tuaHwDARKd4JGB2+R0K81QD4UYSlZBasTXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSRKXWWkliovY8qVo68abtoXtQZqXdDFLls
 EQ9sf+1SpqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w1S6D/0b5eyCDtTat976om/WwrrkmeCrdTpgbsGvagClks0LTeShFP9+nuPD7PIJzrL4/pyP4M6
 osTD1xtFE9oFRr/JKicYaJUhGNjvhq86+P4Nk0irweouqKLqlsQoiqolxRUCRRKWKX/JOFw5UPN
 HwY2EWjrvKNLBv9U6+Nifpym/U8hKQweflNnRfIXMu5yaCEGnzB13cNCoSr5HL1f//BkvCEHlv2
 OPsSAXEeenUZz0HAqp1+xs49AiwTwDocOsc2pYSH5fYgrlshGj4oIr539GC3P6v8XvTk5ciwE21
 8rqNr1cD+xfY0XRI7qsGlSTq5nHwIkmkZMmzCZvCFemTxiQ7z+VZ7fi+sKJOjXXDcDae7+6ti9f
 BKhxyuCoZ9ZUZEjD+bi6CaZy0KjDzBI7MkJ6QkbfHnxjI6f7HBgQw8Az4RIb47ydJsP4RSSktaT
 ycW44vOZJCTTGF0I8DXuOsC8RkSLV5XQYK9ZwB3eg2w1ZK2577lrjRb28GuXgAwUP0K9smBW2/S
 05FciAVt+9P1WzFmvql+IeSba0EOXnj6DpiZDE0L7EjBVvDlAxtiJTyKlAfGM9HaGAZtOew/agm
 7GEz4McYIbAFzg58gtwRtxBmmwapSdtihU3Aq16E+xr+ZxaM48Qkdrw6gtBtwvCisnZthkFavFb
 VxhzvSv/E7NtLnQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX8fHsaUjaVYhm
 CYOMomyde8+SvwIoADKteMKEp1WFDPhPkh6T9Bg5uS+WU1Sgwkr9HGElTejFKfK0axSK+7v5oA7
 PlQxdRdHxwnG8co/IAAP6qz21NzzuMA=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeb3b67 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=jHVjgif8OWDE08c-SeEA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: mDJi39nQos8nUmFXHd2SKBkImYpy9aN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX3FaBCr7GpaHk
 JWI+YoBHUmIT/HeEVee1Rvi3c/uF17NCGjO7ctQDBWBhk9fAdmeTrJhDRJK0GA1WtBVwZtl71oU
 PGUq/tc205nagAVeI452XIztiHLjeN7u1fLkbEui9ydptj0raGSmaeDFoIA0g/BIUfUCKvX3ZlH
 MjRKCS1xLz41lk5w1+O66Egr36GazxEpxn8OrueBDw7weP3WiFUqFqphh1hPhNITK+TvWRkkbWc
 6WspRDMTy1NPpbgMwuXAMA3E7rP/oybAad/9NlVd7WT9m4AJrot5rNyVCo4Vc2pzG2h4T5xBSeE
 miXG170eF32HHBMrlIcmKt8o9RNtZEcm5z5BiOZEPI/173pgDgBK85RC7DpdfHFiWCpYyuvPdFR
 FzZmhUUTlay+Hv26X23X5uuFwj2phulONR3CJTs0nAksjHrUdWOznK1nQlZ3UHS5w/fqxRf5zEC
 AKagohL2Ci+FW4W+DIw==
X-Proofpoint-ORIG-GUID: mDJi39nQos8nUmFXHd2SKBkImYpy9aN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

Define a new fwnode operation allowing to retrieve the list of all
properties of given firmware node in a dynamically allocated array of
strings.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/fwnode.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index a9dcaf7e70765637a0c33af2ae0ac541e15752ad..2d7e0b9245d445d473c7317bd27058abe5750b40 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -125,6 +125,13 @@ struct fwnode_reference_args {
  *			     success, a negative error code otherwise.
  * @property_read_string_array: Read an array of string properties. Return zero
  *				on success, a negative error code otherwise.
+ * @property_get_names: Retrieve the list of all properties of this firmware
+ *			node. On success: returns the number of properties and
+ *			sets *props to an array of NULL-terminated strings that
+ *			must be freed by the user with kfree_strarray(). If
+ *			there are no properties, 0 is returned and the props
+ *			pointer is not changed. Returns negative error number on
+ *			failure.
  * @get_name: Return the name of an fwnode.
  * @get_name_prefix: Get a prefix for a node (for printing purposes).
  * @get_parent: Return the parent of an fwnode.
@@ -162,6 +169,8 @@ struct fwnode_operations {
 	(*property_read_string_array)(const struct fwnode_handle *fwnode_handle,
 				      const char *propname, const char **val,
 				      size_t nval);
+	int (*property_get_names)(const struct fwnode_handle *fwnode,
+				  char ***props);
 	const char *(*get_name)(const struct fwnode_handle *fwnode);
 	const char *(*get_name_prefix)(const struct fwnode_handle *fwnode);
 	struct fwnode_handle *(*get_parent)(const struct fwnode_handle *fwnode);

-- 
2.47.3

