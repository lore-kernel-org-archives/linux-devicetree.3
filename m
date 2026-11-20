Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178823;
	b=MRjdqTMKTI7XniEoGXUkp1vs2UUXPvR/+CXj8yOAGX/LKvhIuVrxQilElTHbXIo70q5F
	 tGLW7NDCOHrz7D9upCbXVAsEcOLdzT4JOhCgflnV4DdZbgT5tjpCtzDrpd45XNRgpAcZl
	 4j85VnT/YGSuB4Dld5YmElxVScCzLXxVx0rwGkDSBR2YRynyQPby5cYtZBcc673i9XOm3
	 uBkEyu/DN2x9DfJsVtORft1aD6B5ABCNQt2yDH1nybamZgazNd9l+1Nq8835xlCsV66i6
	 FTTknRsv9K+yvzhP8x4jx3asFxMrVbFiaBG1T9KlsV5j51b0bMCnaIWyg7Z569z1cuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
	b=ywSlhg9hxtoS1/DrKSGyfgZ4fQ0t7gI2TFCZUX0j81NnZm1NibSAkldcYltYnikhPbW3
	 Ux5ieBYqTXrcPdmtPxW+cp0LWJPeVAVKryLWPMEsdksyDXXb3cPsalDPxMDl5KzzHXbEM
	 th/v/NmRXKH55XH2QZlYuNzU9uOFy1vgAUvydBy22oz+1iZNQqwGIG1GojnDTNXfbVRuq
	 xp8BYTjYRBlat3T2DY2JfgSRqIorqcehDgvKaxE8HTqMFy3rpWmal0XZ6G2tcnwFwUJWP
	 X/t+Y+YQH+cT6G0j5yuc09PI4mi8Lv0iWdbugu2LyqowGLZ/xqzRxja6rZPp0WgUkDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UAMwMCcL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UKv4z6hh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC9860A2624
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECC9860A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UAMwMCcL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UKv4z6hh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjx3n556459
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=; b=UAMwMCcLhoJbJH+W
	5sN1nAYUCQGlFgvr/j15NPQLoqHS8MDQD3TNrbeZvD7We2T0ry/M6uRhu7MeP5Yb
	Vm/b9jVPoe1TTDZpJ4QsWexMTH+RpJHj1Vr7QUld74gZgxxZJEOFE4kjlFZ7meX8
	X8Qc+vzeWqRSXyGcC8CmIecSLkGx15Oym0RdICfwBDGPzbo0jPD8aLpfY3/AQcUO
	pH4kVuw/N9aFZ6bO1CZGkLHjAPP3F8ESP0hHCXX8TnCyH6k3Nhs6HDadABgo9QhA
	LshlcNIOcLXxnmFq49UVNBP2e95DN3lw1T22XpYIgZztX51I4X3cn+pDGxKiei/E
	Qz/w3Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbhu4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:47:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92109408212so19210556d6.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178821; x=1795783621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
        b=UKv4z6hha8uj9jVl+hxcbf8sveG8t4VR72npAGlKoxbRApYc0pS1BJKJx/O2N5wU0M
         R3/9AhdhOiGGugH6O9/lYtTXSq1tlVrIx7NxPApysPek+uQWL/AHSw6BrywgEMOXJs4Z
         mubeXX8gOHyBwZjHUhLV7Udmyqet5i8iUaBwqs6P237asl+AyF+xLNdlum4a6b7ieHne
         9yji+MeOXU4xDnMHFp8mJ33dqb1qFpwatOPGzAdEhjbAonFj0ak/697f9Li1OzFrQuzl
         WkmbbzpUerlktF99sp+ghrA7j9kHb3Ai2IaATnX320RtRtO+sCJEZprDwJ1zxs9FQUZc
         U87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178821; x=1795783621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miMzlMuBpxJY0ZOJ0YqAM8Lp2tavdioHkHezErAmbps=;
        b=bNMiXizDpP4BapwAtQC59SuffjfljHm6CUAZ5cRhabIuKFlbQZwSsvjlFKlyaInJ7C
         wjf9Gm/eB0ihKq53u0xRVxLqCOeJRjfq/wgQMWEsAKnXEI4RVznqibWs9sGGENL/n+pk
         1iV2ZRE2DnwvwxgxOr3LqviuVWiESoKAj5UuW5Oo5K/HtAl5EBIUs8vWEMQxYV9ucxE1
         bzL+Yc6+LNW8mw71govgRQ9HpheLMkxxHnjc1Ox0px2jkunCk553AGwwkV22MNDemPvS
         XWw3QaBacYaf2FkTj/L6xPf/kP+ATdeYQNq8tfCW5RXys06uDKci4O+qCcWzUZJgdc9m
         0uCA==
X-Forwarded-Encrypted: i=1; AL+hErFlOrymSlmR5vE52gFLcI3dsyoff80vLMfuMkS536DZDwyjzG8kJvOfviNhpjxGSCXMcbhfK45n16h2@vger.kernel.org
X-Gm-Message-State: APuU4Z+cP5FSA1s+ylt+miW+SJ6ibmMSOzfZHoZppBlUWLX141qcasMh
	XeSz0l2GBWyzvGmblYKh6dNV8IWw03VL6hTXG0IXq7b4bbOFKUZ83mMsdZouOAsAhxJ6kzkfUSD
	yPgAhvi8WuW/6ILjpL47j7brfjhgw8tp/wO8zq2RG35RyIbAXXHhU/e9MDBpOlNAW
X-Gm-Gg: AYBFou3H35rGsAZooEJW8HNpjsW5Obm/aqTpxssfOC+PZ+JgxxcQvpYTWVexaSKpZih
	Q6EFs4/NfF3eVPftIRU/z1goiQ5exxWvV//LHiZnhk65MYVJyNGNL5ucTdPXmd8tMUYT/KlgDGC
	2f62kQFfi9A5giskq4rBNHx1hnWbP7CX7/x0iqWbHelBNYDkJ7ffQa9rEC0FKH9F14nqHDZHx69
	DsUCs3dfK+FF593p+MarugbCtSycWQBKpHN1Hu7X+LxO9mI3ByBwKjTktbS7Plg6hY/p62SRNWo
	fz/ZqdhXn7PmGSgqEgXOUo9Cdan7Btszxzr4iuPbhVLM3d6zGgGkLXqqJljtCs7HONWCEmFpxTV
	ofHFKPDlt7eBmAiVtqE5KFRzNj08bOW3h9YZfOw8MYIbwih/JPLGKke8NxpjtyEPwkC4NC4QZiy
	A=
X-Received: by 2002:a05:620a:6605:b0:947:920d:662d with SMTP id af79cd13be357-949ba9a2e20mr449853485a.35.1795178820832;
        Fri, 20 Nov 2026 04:47:00 -0800 (PST)
X-Received: by 2002:a05:620a:6605:b0:947:920d:662d with SMTP id af79cd13be357-949ba9a2e20mr449847485a.35.1795178820256;
        Fri, 20 Nov 2026 04:47:00 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:41 +0100
Subject: [PATCH v3 04/10] device property: provide
 fwnode_property_get_names()
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
Message-Id: <20261120-fwnode-for-each-prop-v3-4-808e304dc73e@oss.qualcomm.com>
References: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
In-Reply-To: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4357;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ssHUbGJUv/2LRpy7w8mqQGXezqPHplT3SIfG/I3JPWk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE3PDjq9bQKPjkTMTdlUm3r6EuwNZgwKcvA6
 jSm1HIhu72JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNwAKCRAFnS7L/zaE
 w6y4D/kB0ChgwLoHAxKfuVspn2U6iejfyGbyMWeKeXaxbHy0Si/yLGe0wKT5QwN4Fd3leA4UbK5
 MzyqKqV4Z8YdcmhaEP5nJKGIEId4tG2SorN0mZC+L44P3RgDqOVvFy7OGF5kv63XLTBgT/42M4T
 wq4479LNWVbjCFK5k7ZoNOReyenKeA8Iyp3iwMtRmK0DLf+rXjK9CR5YG7kzSvqUtwUQNj8VP7t
 jk80UsnzeP55CP4KNqtBWPcx6AXKlZ0sJFR1Gfgp3h3WGKNVCAurA7BNKsd9YaUw0/JgQdPpxIr
 Q9kV+/akEb6/mwSwNf+0IwZrahSLTJKlMIYzDgqMkyW0xnEoES+9qwZjsaNNXFNv144Hqce1RYw
 A2iOH9Ao7UKBFvmrmvEZ5X8wSmFrcOJ/TaiCJ2LgyhfFvqIL5QBnEtYbfSA0uv3+ayqpX0iYx3x
 uByB+nGi+lL2ZmJAFHwk14fYruBd0Ly1I+eGCsUvP2Po8biW5AI6Gep37pFDo4DrW4BFfm3LfmS
 FMAiTUn4/EAG9eXYB0+22s8UDaCDMMwYKsblP0xsxyztls/mG+nJ4fi6Wp3v6RxGqrbEIEVlemF
 NtgAOsZ7sNPUZIjCfVWEWlzBLvNrsrEBGgZWs5JAO6dBP+6//F4UZstmM/S1VFeAWPQR7Rm8gmx
 1Ect461AWSQAECw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXws2iUFeDC4zW
 J3brVO5b3r06qUgmOgU9pOnzxONvLNT1dYi0ij7f7ePJ94KnmHsGt2G6o7E0zZ1MC98DGIxAf5E
 VUeBjiw75FY45wShdoYpbC5eJVpvCtR3z8TBVFQ7rVOOfd0owczlaLhSxtz8PYixjtzotfjQcpW
 JDHkY0lcuiheEL4yZaB3Vf5Yreph7npHVN6/XyrPoeOTvX8DnStUkD7zsbUqKrddKQ4HEHO6/iK
 mmHtxkdZ1n72rLsRb+lK57iIhslHdw+CjcLmNGgFNl7Tb33jT282BQpugaqmEwzRQQFoLggU43Y
 ioFoJ3SM5liGV8e+A0QGvMyiFlIRf4JrueK7glu91Eqg73AIxSaUIn18JeEgU60vPimi5R+KVgV
 6unkU0hk/LArx0QdSGHO6SWuTqG+B/+fTomuvDkEZOhB6KxDLVf4TikJjQZbm5Lc4fOES1Ba4VL
 mVAqpovcVE6/TcVW/Fw==
X-Proofpoint-GUID: AXGRDBNc010zoyMy6LBzezkuYqhoeEkb
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b004145 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kmiii08LN68srmAI8Z0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: AXGRDBNc010zoyMy6LBzezkuYqhoeEkb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX99bCsFEZn1M+
 ivPiYTTtwRf/rso9Wag10ClXWjS4zGxtAwU1AJO7WwAtEgw5z2kD5wet7+TkqmTzPdiL92kV06q
 d3lSmrmqxrYijRdQE2lYbEOt/oQILvo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

Provide fwnode_property_get_names() - a new fwnode function that allows
callers to retrieve the list of all properties of given firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c  | 80 +++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/property.h |  1 +
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 7728116e296872b7ea4d4475aee72d95edf63eb6..d3c54c3d11c42ba4aef68687fc27291c7f33beb6 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -11,11 +11,13 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/minmax.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 #include <linux/property.h>
 #include <linux/phy.h>
 #include <linux/slab.h>
-#include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <linux/types.h>
 
 struct fwnode_handle *__dev_fwnode(struct device *dev)
@@ -542,6 +544,82 @@ int fwnode_property_match_string(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_property_match_string);
 
+/**
+ * fwnode_property_get_names - get the list of all properties of this fwnode
+ * @fwnode: Firmware node to get the list of properties for
+ * @props: Pointer to an array of strings. It will contain the address of the
+ *	   string list containing the property names. Must not be NULL.
+ *
+ * The list also includes the properties of the secondary firmware node, if
+ * any. Properties present in both nodes are listed once with the ones from the
+ * primary node taking precedence.
+ *
+ * Return: Number of property names written into *props. If > 0, the caller must
+ *	   free the array with kfree_strarray(). If the node contains no
+ *	   properties or an error occurred, *props is left untouched.
+ *	   %-EINVAL if arguments are not valid
+ *	   %-ENXIO if no suitable firmware interface is present
+ *	   %-ENOMEM if memory allocation failed
+ */
+int fwnode_property_get_names(const struct fwnode_handle *fwnode, char ***props)
+{
+	int ret1, ret2 = -ENXIO, n1, n2, i, j, count;
+	char **prim = NULL, **sec = NULL, **merged;
+
+	if (IS_ERR_OR_NULL(fwnode) || !props)
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
+	merged = kcalloc(size_add(n1, n2), sizeof(*merged), GFP_KERNEL);
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

