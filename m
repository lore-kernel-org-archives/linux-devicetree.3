Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584835;
	b=KAm2t9vQ+54a2Ienk4Rlm7yAkUboL3512Rh9n3bsAKfLLmJJuJrwegqDWwPvFEX+ty05
	 sF0ZwHl1GxIvzD5gX366bKglZS+xsc5t+vEojHgaBR7pW1EY6IgHPrRi7weJBTzqlPxB+
	 srp5e2uO3EOOrth1WR70P+b4W5N0/eikOhrUFpmMN+TsIo3uyEMigeXcOrpbQ7k3df6us
	 1uiZ0ERhzVQA0Suf/YKa5NtZ7WDDvNTaMobE2JaKQs88NJqQaVlzw89rBlW67HPhdAZ/R
	 OwDvax8bOCsvQxhtS8RmOFfTM56wUzJHLCBITGzCnNuusP2uWmfxufhs7L9uKpuThyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
	b=fGFJSoRjKDMWBu+sXnCw4zvcoFJBc2Tq99XkEPlocssm5aZoj6lzEE4kH9/ZRR3VMCI8
	 pgPvliK5KgAUDQqWtQSBb1rs8o6k7DccpwF5nakoMXUINu9KFLw1qAxRr5na4whzkViRs
	 XvMBmdDwXFNSK/GnDaMM4m3z5uHKXA+D6bJVzJnl5RTDL4ey2VqqMBa9uQ2GuqsdH28Y/
	 Ehkl+aBB/syTxywk0tDfzsmUQ3n+yYGDRNfeEM/DnOfCQP5pkomE9PW2FNbGx9tURcjdF
	 dpnXI+6rcku8+y4wghJxOLZJUqPOnGtZEqS0lawTwpjfi/z6Oyorc7WsEuJZkU5Sw9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ayi6Eg+O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H25Q8O25;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684A5606A8AC
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 684A5606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ayi6Eg+O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H25Q8O25
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRRID3296047
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=; b=ayi6Eg+O63IiTBLO
	aqwR1MzJcaQbQY+c3boQA+MX5zk2g6EET6JG3rVQX8Woz0bMlHrl5OM9GU6w71aa
	+/dZsWCbKNphMNNbckUtmF7riqhc2Y+jOnlFRS+OzZktvQRCKbh3ADhAuypPOKaC
	BVxLJUscjeaSjGGSNgZj9ts7Lx/8oA9Hks3saOq/BdDFn0b8IQ1mIzL71o4H8Aha
	k0aE5YOmIO2oJP/y+d0IQe19Twc4Vs0z4EMgX00Z4yvFTYQ3lOvCreIDzt/OM4gw
	xVGS4wMHGm0SGrMJMAXdZJjwJ+uInlv42CT/5THt2xc8OWUVFTKbrnRf1K55YaiB
	D33sGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6t0mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:47:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso437893085a.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584834; x=1795189634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=H25Q8O258Gtu9tPQnl785AIBqPlebbC+4+2PjuOZ4AcRn1TN2x2mD23GADMsB0yrwR
         KBTDy/foJsKvjp2YgQADeGQghCENyGqtjzATRhgQtA/6Zu/NtEMkNchEqse1MUrfZF4g
         XcoBlYQjHFYiLYCRU05jmR4PUtsVuv4O/gULM54kQNcAPbxObeWMlbXszhRMj7fHOoli
         3Nh/1d0SG4R9yI33cJKlN6nezmrur4+enxKYkZ3mBaXTx1e1gAjdkcS4vAzhs9vhDKMu
         XbQu+Aov5V0LpWltdzFjFPu8kibqaqnIv4/+czdf+K4BwHaXP0K++L9dBkr3yiefXys/
         urXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584834; x=1795189634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=CgPDeaSuasrdVEcM+BZINYuKhMBU3DixZzoZHHW0Ryipu+JgHfB1I5DHdo2V/o4Jun
         cxR8mH0TPghD1oSxFr9iULjQalMsxs3OXKpBNLJY1MhLvodfNMt9/EmNEdkBUvQOjsVg
         l2itUIgRX9Wuyet/GAykKVTuGeKeZQq46LFiqfjyj2gGhTpLJDqiskxfOpSZs6NS/9Lj
         cxJF2q+/pFQ2S9KHiT/OMpK1Azv4MWw28Cvc6QHbCvovgoJOYnwPLAWReD06ygo9liLK
         urgEdbm23z5RjcGt/GyKj7kosSPgLHZJeiXwFl7cNUxcpMHMfK/bo7ZLmksPwYzPTSvv
         ijmQ==
X-Forwarded-Encrypted: i=1; AL+hErFR+nceKyX7QvTtF2iFso6kHMzkLUJZBrNgH+HoBG/L8LjoDZzWpHwR9zDRMcPPRIZxRBgprymCXkpY@vger.kernel.org
X-Gm-Message-State: APuU4Z8kZcLDgQf2RrB9Xv+63nq05Vq+aYMYBteR/aPPDFlB+rwQ/dLV
	75s73Sz0Zr2CfouAI6UR8MH0/y/IsaH3g6TkT85EbdMsRStZdGCAsni95eiRakGIad3hNIJg2HZ
	Vs9CCjqxgAzQM1skrio2E7C3M0fVDojiTCNV4eZcrOezzYjWR+h/fYQp8Z4ZL/bMS
X-Gm-Gg: AYBFou3qEypK+FqxED3qCekpr94r2uuNlJWXCGiqNNLb216jS8DBZwiI8SlpcxBBckK
	4089ubvRTJVVJv85Gjcq1UsUQIAduWslOXeqEgz3o6ptJ7e40rPCnQqeannzbfFwN3/umXKvqhY
	v6a6ZINguYW+bQwJr8aiVyYtu6FbCGYOxfDwibpDATKWZ7YDIDVsI2SezVW3HkWhJNFnfr2gOeH
	JCQDCHJJqJ66VtzYjtpcsGTW/7ZxpY9xhu5LmVogtXLPhugijOv7/f3p/I8AYVuhu+HUVyrh3J3
	OGL0j0hxP54mxDr6S5wOhj3rmJT2UhtMuX4a5Y0fVE3mdtMk5IbPWeAlm+mM7mJo2/RBvYAvMLo
	wozE+lXqA4Nf/qjtcQReLlEbqwH8+2zU5kcGIVG0c5sGvPnIXpYRIZEJTW7NlbfEl/0/C5lwEpZ
	kBig==
X-Received: by 2002:a05:620a:470d:b0:93c:3863:ff7f with SMTP id af79cd13be357-94932adc85fmr983715785a.0.1794584833655;
        Fri, 13 Nov 2026 07:47:13 -0800 (PST)
X-Received: by 2002:a05:620a:470d:b0:93c:3863:ff7f with SMTP id af79cd13be357-94932adc85fmr983709185a.0.1794584832967;
        Fri, 13 Nov 2026 07:47:12 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:03 +0100
Subject: [PATCH v2 03/10] fwnode: define the property_get_names() operation
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
Message-Id: <20261113-fwnode-for-each-prop-v2-3-4edc23d5cf50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vlyXEW90tuaHwDARKd4JGB2+R0K81QD4UYSlZBasTXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD3CCYRkoz3LSF5VgDezGuy7MTYSM/0TdLmX
 qVEWgNL346JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9wAKCRAFnS7L/zaE
 w1UjD/0V570v+6T5CVF4PFoZpn9KSq17LrtfokidpFBT7RDjt0GRYJmyKILIOlVrVDojHSNz5IE
 ALF8BoTy6aoU6ezLy4spqH3OC2kZzdtzaAg2dkBDAsHLjeXT5/QA+l6C9Jtre2CDtyAV/2TZfu3
 vVClJn4JVhPMDmaHAFWQsvSEODTOv6nFe8kuJ+xlmjRkoJcmKxzO58MIdNod6070QXKsdAOj4Pp
 J1WlcbOE7ohJPbiImQO4upzTUygicE1gmchdSj4okHIh5n53012m5vpVLKBCRweFnbUpLzhu9Pe
 jQF9QzJw8Z0s9DMHUZg6D6jxI/i79YzJJ6KPK0LgGs43jQAFIg+e/GaN6z5hWcSVco+n0f/sWYg
 2r22Fsz9+qknrFCJ0ioxrQicw78BXXeOLMQsNOATM9G3cHzy4Nxoe//20p+12c+vEyLva04Z1wU
 l1n5RtZVdhGgO+6zL/L7aE5IO8ZG7mIV1aXSJ+JkbWyn6K9szQrV49Z3K2TNAfCLEQEWt4xlFou
 L5kKlZY8oi7mWvpB0XVeXi7qo18prewpNF8k8AyEit5hNe8OZkyWLdENpHK+kiJZ8WYoBWyaAh0
 ikNTb9r9ZSTfZLatbOnya7dMYksWgzSjJ/3zgN/YiAF19+LkWm9T5CqXHtHmOeWZ3fWSZOyd0Bc
 UU0maWv1yZ+Xrfw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfXyxkQLEQN9p3d
 DDnPqWwqmWaE0aXbv0lBwDnVABt/+OhVPa7oWM15SU5HulO1VYKuebUpav31/koA48yC9y3CVSx
 g4EC2ggHCZDV6rnIDQb5uwZiFBYSIJmeFCZ8W/gBzxI/rTKNqT5OIrrMzLMotMz/cllhWlWXjip
 3HWkw9vzcVf+wsftrUNLV6J1O1YC3VDkAOrDUs06IViwineMqR/MBYf7PFm/AIza6OdlalxcuPr
 PPoNHwiFkRxvxdjraO4PqmxwCDgREpplhvhiTPfCi1O0e8dgc+g9GI216Yp9SAey3HPN1nYkctH
 Z60B1nKbqyAMJZLukXtiVKbihtQeHENLMEcslXDIpyXYVqED/te65fYS299o4wmcRCu64WZLIkF
 TeWdLUvFdhGM1mX/DdRuvCD+BmcbaLGYfRBrEcucKRpgftfjpvlApji5LI9A8KG064r1/cuNzOM
 LtdCFQqBm1Rnqcapk5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX8CWx8vRiFZz7
 BAVRwAxD5KHhz0IMt8YFwUQ+fEDq0n9b9yVFWfCuC1UwQVaep54CoqkzHtX585CPDK/Q1Ujinbx
 Ws0W/5h6bQ+KipouWb06rImyzj1Vbyo=
X-Proofpoint-GUID: tvrqBaFkPlq4SsPyls4K-6Z1qL6LwC1J
X-Proofpoint-ORIG-GUID: tvrqBaFkPlq4SsPyls4K-6Z1qL6LwC1J
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af73102 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=jHVjgif8OWDE08c-SeEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

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

