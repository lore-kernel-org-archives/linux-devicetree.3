Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801073;
	b=y25C3nxL9FJMMNLTZ5XwvcNSr7JIO+xy7m6+NncsqfbTp9lIjMVLR0AqQgvnTnhbpiy9
	 LFIkQ4xEBQFjJumo12YavuQRV9PB81Tai3mnYnedDkynNk5+GjmXsgnIuiMDW7oDrQYTp
	 iDbvy7HPa9KvZ0Pa92ndyR8SuBO2Sxe/jc9NYloDYDqneYLqbjnSyPTRJRJltZDsftuHi
	 JTJNoMO3fwaGDxcvVzEaDEiSkFtRVefKIocg1eXyFohillA0fRsPBu+5xTlb/ji6dUKL2
	 flK3Be/8XarriqHoUY0cHI1g6PFL0tol207+wrZBmjWU+KRdlQYmLPGab369jmTl8Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801073;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=;
	b=UzQY4U2NlrvhNgCJQ+ikYjqPLHqlaLmBkUkdv9yswGvbY5SBLtxD/9ehiVoPKf9SojXy
	 8bFFikTCwTi1TmQuuTjTv1q6DPwdJRJtWp/lXBI+RCp0zF1GOBGyUkvWxL+L2j0KIhmd6
	 JJugBDpMI4gJhffkLlCaU/I/KcEPtozKXlpe5RE224i+oRJJvHa43+LiTLgltPUr6GB/D
	 Fc/6pyI58iDzPsUsgvbGe2GUmEqpXJW12/1WCqe/6C9U46kFyen+Y4JScKhEq/1MU3/DL
	 8hzqLQDki3X7jZGs5Q7+xEWMAMDGaNXyY8n36yO63+QojXGuPRRBxH7/z7x/SDM+rwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8TE8KXW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nvd55uc7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A2D606D816
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A2D606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W8TE8KXW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nvd55uc7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba0st1667658
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 14:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=; b=W8TE8KXWhAa7mSse
	KqJyND/Uo3fINN8csA0WHZcbmFl7o58YkQE6yUYKCSKHoncFZiEhoUB9yB/IcGpY
	lv5bJhF9J6qBLZIjG8jyykN936enW2UF1OG9Uj/4xGwFwk9jUQRRtOjGGqWzsmpa
	RTf9H3EWCGZa4z70OSauZu9/CtxDdBs/ZCrm6SH0ojWgMurFD9Y1jLXJnR3rqlwz
	yj+YdduA/Cu6kaCsFKOTCKzuYtUr1TmmfvVVGEV5NJz/s43L1P/VdA63capDaYVE
	WxfbYInzK5O6PFMX3QQ5vxuGTY3886ta/cwtsQh0Man9dDcVV36m2GvXwM41XBOP
	zCge3A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nm4ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:04:32 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98304865f02so649102241.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801071; x=1794405871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=;
        b=Nvd55uc7F/dNPLn3UffYveit80z8b40b1mR1tgD2MiNzyLBz5cxaj+OwpjzU13xx94
         phKD89Pp27IcCcjbZdOISaILbvQb/kmJ5zKRx74HQaIcCSSMGFDiQDCIbWCLivTEAQPY
         Dry3Z1K6d6Czxa73bEIy89aeryXFVH6XL0Fzbdz8tK256zy2U/j2ZuTG90klb55wa1O1
         OpoT6iRDH6NLHYF7ml9LBrhYFTvuxx9357O9tU2Qal0KWg/KdHv1HOq/hDFmDdcXQZ6w
         Y7ddotEEjpxAUnaqy8G35fDuq3OYkWfermizFlCq7oZIlJjuNzgKRyMgGLBxXkv6WRUu
         Rqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801071; x=1794405871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9H2Enry7Lq5ox0n9An9Ex70nh2Mbgn/+cNEyqjd8q8=;
        b=WeGQyRhRTuqbd6LWLG7BR6vSr3IlD8PZ4YUzGgBcCQm56WR9jDQBRCrIiYRi3DAfV1
         z5cCpnI0QBG0GHpxlI1FarPN9RXEI9efADM5n54DSe/Ou2IgQFMpeMHQvT6ic+CGL076
         tLCNe7GJkHL516bbDln0vQknoVkVH1vrihs26bQJjz7ex4oyRW/k1OJHAH0WKHKK76jJ
         SL9PV3kdHjQhlNdX07/Qv4aeouUo8Vqk0tCJAUpXaGMeaPy4LdbldJ2++aXrSAjYPdpA
         SSn56Gwyn05Fv5Z8mvCR0/41ywuj4T8PUhcOkJ5ilu//fNKjfulvZ/ykGSaNZEsnu2d7
         +Z1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwSs1LKqhtL38Gf2mbEaZV7T3FwMcxD21DO+t2SjTxEY2r8oohXE9BokgsoEpS1DYZHGCHHGLAjnJ6/@vger.kernel.org
X-Gm-Message-State: APuU4Z818/uxnVw3jSJcXJj3+yRpz++6T0p7Xaxcsl4Sr5/MW1BnzjBn
	dpEtG06aklWB6bi9TV815bR/E9um/kMKh3s5iGPdOBJWyyVgv4Z3gImrOTsoXfv4vWIzUJ5fYl7
	kWGJYuJvZQAEEXLrG1qusAveKqHBwWkhHMBZEutVG37iRuFJDLVWMRI3VrcHm3grB
X-Gm-Gg: AYBFou0jG1xbInxHWSEab4+GZ62oTwf8JhcDgbyFV5Pwf7ayCZ4t9dkPHYyNgFuSw08
	bzgplLH16mo5ew9yCq+QyjVQuu0eHLj4JU7JpmJ9hs1BCjKwc0DzRt1Curei0tWD5PRfhHkn5YP
	6JP0MQgoxcnf3Hr4pvxx8nCAmctPba3TCJG9U794TRETjV5Nz38VOXhpNl6cweP6lNY9NdwcMRn
	pi4H6q0Ua4tQ82uURwxT+KDASKCVSfOZBz0/LXQgQr0jbNQf6QCP/vJtZByc9us5X8q8LrHfUvw
	EbVjDxrg3vOvxXe5MZgNAr+zsbzdMEvSYLAyy6vDoAWTyGm/G4UykHfrUQqSBrMPSS3thLa3a85
	XK2s4n0RvhM2KNR330J2ZClyxX85wzMPrhPKPpXTIDwMzUSutSVlUVqqjMUxtHihVU0yCbj+EI8
	2SbA==
X-Received: by 2002:a05:6122:2491:b0:5ea:c90d:d1b2 with SMTP id 71dfb90a1353d-5ec68993be9mr6944318e0c.13.1793801070088;
        Wed, 04 Nov 2026 06:04:30 -0800 (PST)
X-Received: by 2002:a05:6122:2491:b0:5ea:c90d:d1b2 with SMTP id 71dfb90a1353d-5ec68993be9mr6944269e0c.13.1793801069615;
        Wed, 04 Nov 2026 06:04:29 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:47 +0100
Subject: [PATCH 5/9] of: property: implement the .property_get_names()
 fwnode operation
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
Message-Id: <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUearllheTUa0mAxFBQA4rgfpmwyh1HyyvDmdireIIM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSMudMNgYFqcJmZ0DLcgsCP+qirtdi2op3S
 //eoHjcXWuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w5yqD/952xG+8H9EKe/LRTYijZFEaI7dbjICEKB8Nx0sjEwcYjqdBdkX0oHDq9Q/140tjPQSf+u
 qUdmFsX0hn6S820xkPwyyBg4+AE0oQYD+GabGX23mtxW1HzzaXaX0EE/EIO7Rgq9eQxtDqbPLK9
 kbqiniYPqMBbaBmtmjWgVwuJ0foj+FXKTtw95VwYd95a1/fV+cGb3OXffG3FflbxIXHVxZ0p9IH
 VA0B9agIHy8sRzm+pJKufG2sd5PGB8NLotn+zNMLTJbiRvJxXO/TPluKWty89//xYOQt8gr5jvW
 0OOIVr+vnBwi96VTpN0KBoxhE2acadMuU5PVAmFNNpUdiialK77WyltSv20jRrG3mzarDMctQL4
 /rI3XmjAyOWxrgQmoLx8REtpu/BbdheaZTlXUee00w49zypxx6QxsnzhRvYoUSBYAaDy2Fc1esh
 OSuUqmpLnhRVF1RfozKZOKpUgfq3hoi6R144EPidufa1CVMmfvk4s28C8diZQb706YSNBPlJCsj
 x/Zi0ljFw0fH+hlrBrb2K4PBvX7HduzJCxpPIbR8V4SzAaS5Vp5jrhJhlDGzDbALi5G7uE4CRt5
 QF3KnUhWpvDRhzBn+K6fbv8UXdtVrrFfiVnhJE1I79zRBKUWOhJ53fubnCpzH+/9Kit1B4lUnbx
 gRgmnYNRA18XMmQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX15TcGMlUuOsJ
 pXq4kSyjtQtVKDctel27mkA1uxiaWbmERwNPfijoAYedB5Erd2dNUSvbkvmZIGnK/IWxZrslWUB
 gMYwGZK27QlcWZWcfGow53t3/DOasf6nitsFWX8SqXykUdwDUWCyq8TePxNmo9tmOVFPxUf6SB5
 xHdYTT7PeU/IJFkj92rUG5/tDlBVpZPRGU0enakDBO3yoG76LfV2+s8q0tqW6ZVCuHF2j1RMpDA
 PNUS2SXBWkDPInfMCwnCFSmMOlydzNzNPkPi4Kycn0KaVa4p1qRVnkspPJTORdY4FlOzFfTdZs3
 g6Cr9vi593i70j6TGvPympnCZX68VOyEUy2vbvdsWrVzelwfWo4zzl8nh09wQxc6c9Jl9buyEJb
 6BlCE/pBtjmmSr01VPuJI9CoDqRDV9vJq+ims8+RqtKGQVa9VmoDa4iHy3ospTis5/2oIAWUYuZ
 iQtiEEm3/SvGTsWQD9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX1hp9cd6M1J7O
 fSN00Ql1+UcTL4dIquycWPsmgWI33TtMp/c8UatWwXWHsTYp1vTALZCT65BL6AZhbw0mjo2t2Wr
 rHAndbweUS2TZrDwf/C3RWMSfUoCBxo=
X-Proofpoint-GUID: JchglJpWK-unVleIYJnhxWg5Au2VAxvp
X-Proofpoint-ORIG-GUID: JchglJpWK-unVleIYJnhxWg5Au2VAxvp
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeb3b70 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QAC4ccWuAPOjo8k0q0QA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

Implement the property_get_names() callback from the fwnode interface
for OF nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 45e55f61848801ed497702c6cfe501009904c49d..16c9c307633bdc7c9343782b1cd3bdb845552c6a 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -28,6 +28,7 @@
 #include <linux/of_graph.h>
 #include <linux/of_irq.h>
 #include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <linux/moduleparam.h>
 
 #include "of_private.h"
@@ -1120,6 +1121,34 @@ of_fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
 		of_property_count_strings(node, propname);
 }
 
+static int of_fwnode_property_get_names(const struct fwnode_handle *fwnode,
+					char ***props)
+{
+	const struct device_node *node = to_of_node(fwnode);
+	struct property *prop;
+	int count = 0, i = 0;
+	char **names;
+
+	for_each_property_of_node(node, prop)
+		count++;
+
+	names = kcalloc(count, sizeof(*names), GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for_each_property_of_node(node, prop) {
+		names[i] = kstrdup(prop->name, GFP_KERNEL);
+		if (!names[i]) {
+			kfree_strarray(names, i);
+			return -ENOMEM;
+		}
+		i++;
+	}
+
+	*props = names;
+	return count;
+}
+
 static const char *of_fwnode_get_name(const struct fwnode_handle *fwnode)
 {
 	return kbasename(to_of_node(fwnode)->full_name);
@@ -1712,6 +1741,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.property_read_bool = of_fwnode_property_read_bool,
 	.property_read_int_array = of_fwnode_property_read_int_array,
 	.property_read_string_array = of_fwnode_property_read_string_array,
+	.property_get_names = of_fwnode_property_get_names,
 	.get_name = of_fwnode_get_name,
 	.get_name_prefix = of_fwnode_get_name_prefix,
 	.get_parent = of_fwnode_get_parent,

-- 
2.47.3

