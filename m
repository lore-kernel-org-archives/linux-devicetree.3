Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178821;
	b=TuypTW6x/OhkYB0JJS45NjNlTcmRe77a2NBvshUOOuGu6c3WLHxlixaDOMxwYqcCha2v
	 +0ExHSnRmSh2czwnftE4VHY4qoYB3bzwLQU6uxbYOS8MTptoJDI1y+7bmsOu9C0dNVrj5
	 2ZLuO2/2tDNvme2NGCsBHG/bFY3yBSpK1xdtSBj4hP1Um+sg155WFgGQtzE81XajOxSwF
	 Qlq1LgUE1OYjCSgfpMnPvocv6mp9HZP92AnYnOl1Cq6iVaht6VY/KabkbdvdUgmr6rwac
	 MAg20EK1xZTo8q5Rn5UQqJEqsIDmtqdfMdPqp9Mt9b0w62XhM5Hni5vt9ZW/RkG3hQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
	b=DNhtCNUpJl9XlmyANVq3P0wiSrp8ttAVqlV2momc0Po6OKUPDW4mw2iPAMSmgFlvarX1
	 Wl0RNRnaMjQbkRLGkVjPLhimQRPUyg1aeohy76Dm/cI5OAl2VxoQAb/9H+9I/a4xWphNZ
	 KUVKu/CTyaTtEEl0dvjBomo7A8eP7eZbxR5TK7DKiXFsTpTy5okNJn+nN7O34O8zZpKwm
	 M1IO5W9LY8qyxV7q8uOs9dYyJBPQ1o1l2EoOruaKzg5aXYcuisIRoYRoZuPt9l3umSnZG
	 bz10PZ1l2IrZkK+zNNtJ+hUEHxK3szHA5BMI9KNe/sqnJt+5ojRShAgxejAxrJxsTZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NjEZIDq9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j+1ZjdQE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B79760A2606
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B79760A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NjEZIDq9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j+1ZjdQE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjugl1168927
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=; b=NjEZIDq9tn4Z2X5E
	0HaiSmEYxLZfR95m0e5mOAQrJ36D4UvFWOcUkPlkrAzmdt/SzrPUpH9YNvLqe+6/
	se5miVwDJmett3+70EUwKaCq8F88mLX+WFnVQQmwsmnUpTs5W27KVmO18hMKX2y0
	AuJsOqQMbXBUTBEtKr87UK1crqQkuYbw3tNl3Xu7FVmLGg0qTUAh8niOmNbXLCZk
	WsmYv5U2hFMbGOPUyAGYvNB5Cbj201pRjoPvQlrfAnc/PfFIbzGuskjCh7hrAy9V
	QL7z2J4ER0w02AkWPbiALFCC2e1wLQILLEpsBKRRV3kUWvVmGBHWCC4LMXB4W0p4
	Fwiq8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5usey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:46:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so161210885a.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178818; x=1795783618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=j+1ZjdQE0SlVRXDrtu/Kk0/nKZyNW5BxrPVte4tctk869ofzCViwwjPuAwFH+jeH10
         84nopc2bXBdUeb6rF+i3rthJBBXppFj/lXTfAJzN/Fyzq3Hx2mdDcn5zHQ2vg1Mjw3pt
         bl4LVm7Dfv7qtbwnhnH1JiB2PX+8Np4QnMzndAUGWRQ8uNWXX+qDggp9taJxsjc4i3jD
         V0hsmZoYhz5m1K+pkqA8TM87d5OHD6Y/kOOiF9lmbd6yIP9D+fvHlzuiqpjtAyosCi30
         q1IBG1cIndSY9PS3Q0IEVpw+euQpq1eE9f9D6cp49tbQIIg6z+QRAPLWLSXmyBgi3r9F
         +WwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178818; x=1795783618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxZg8c2Cz//qVnbPlOJ1FgV+cIcIhYnMUtcgwkzh4NI=;
        b=TT0vQOgTWttbqg3DrnEvoMleSDq2x8IwFd5PHUiqQcF0ozqf6nxQlXvW7irjxJLubl
         IxOzpVnEyVCm8jR6mTvFrfjFZIVhraFjatxgJzOQOxuUh3N0bqEdtcS4uOkR4bcQ6c2x
         eOcY3M9c+0Km7iqtI675CNUC4rcaiyIUoU1Rr+uZr5DrA7/MEeaP5eMSimuX9CCMnTET
         PWQBBrwoAJznCd/HOjhDvDBW07ibogSJMGDFsaus1QB4aWEwXDQ9xObX1RoqcvDslNLS
         MC4j/falHXzyWJkmkyFuwvvn1nTK5KOSk6sHKUtwTSUiKNdr9Yh6SiEdz8QSW6mcY6vJ
         eGGQ==
X-Forwarded-Encrypted: i=1; AL+hErGPeyABaTe4hFI9VZjLWqI66mpAYNXhNUjfJrUSSdR/0z+J6NLMPm9wOe/9V4WIOzUL3aIn1ltWHBPL@vger.kernel.org
X-Gm-Message-State: APuU4Z+XP7RsGQh5HzsJYyN+IpaNq7lgI1PypBbm1i8O3kRgejHYM+Tw
	mSBi6yl96pNXJPBBzdZaV6cYkDH09JfxrSKVuVsNsDfl3GRWHax/A8FLqM4X/yZxrOq/bwR1KTZ
	r3l/UeSQwTwOfq8asXVmsYrc4DQFP/R2satCrgEYJXi0JHzSqba6GAqCMxZdEh/vp
X-Gm-Gg: AYBFou3nA1nruukQRxxAybutCzKNbm87PAR9Mp7wdva76Iyaul+FUTrplWZTh/USvTU
	oUoXros9hREO83WEfJM38lzIMXSF6KYW9YG1sXjT/w+uNkt6/WozOeVZNFa0efYNZOn34LUkFNU
	14KqmSS9Jj4WUW+sARnWpqNdElaSgT7ZfQHuoP16W4JhvNMgMz1AWy6VebQWYqRf+sxNH/vVLq5
	U2lyuC06nMKVaz+B9Yc4irPPhe0IgC8I3lAGLutsSfE6mILPYaWUk7lCcz5CHC7qKzCSQT1gOMu
	dWatk34m0anRJFMM3kI6nHg8Ab2SRz9JEXeaUAIlFD6fUQs2pUfUpXG85Z15o+2QNzPoOrLP6MR
	PvUSPGjX8CzPRAaJCJdg80/g39hY1fv2PscuvntlsimuA+O0kwEmhnXdwkU0UOPsD38++QVR2pi
	w=
X-Received: by 2002:a05:620a:1308:b0:949:6493:7c6c with SMTP id af79cd13be357-949ba9e05efmr449539285a.30.1795178818330;
        Fri, 20 Nov 2026 04:46:58 -0800 (PST)
X-Received: by 2002:a05:620a:1308:b0:949:6493:7c6c with SMTP id af79cd13be357-949ba9e05efmr449535485a.30.1795178817851;
        Fri, 20 Nov 2026 04:46:57 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:57 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:40 +0100
Subject: [PATCH v3 03/10] fwnode: define the property_get_names() operation
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
Message-Id: <20261120-fwnode-for-each-prop-v3-3-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vlyXEW90tuaHwDARKd4JGB2+R0K81QD4UYSlZBasTXQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE2YIXomUiP9/eRkoyZzWQkqxyOPxkHquCjX
 15WcGRwohyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNgAKCRAFnS7L/zaE
 wyGKD/0aFMoAZkgBZHdI4bxjsR6xspltaKVqqj8fM8pz5k5lJatsHR36nDle+C04E8L3ip3Rws9
 aVGD6HnZjtIDPLqidEbc5Mjax4aHWXq3WpwWO7oC/GRFsDdLYWkQLwbJWmIF3wWCIzIUJC4IrzK
 sOr22Rk+bFBM5DB5p1zXrrSfjdWeHukDbg7JOGPpi9DRSGRRLvAlm2zt9oTbGtSpYA0HQRmdYJN
 KdPC6OGSROSHYkJ6IuteD8y/j4Qi9O0SF+2Zqp7ijy3dHMsKByeV8J3fHXeeNVhZE9RJ5MYKDjE
 W7ViQJYpTz6o+HUXnAK3mXITMsu5SWQMJQB1P/cD4tDRmUuaMbUtesJ7ff1ht5lc7giXdx3zCkT
 Z/uA5X//2XRBWYlV5YuCUD0X5MUGXO0FtOLs3ampXNHoPxqHhegoAcFiK3Scpmm9/L/pHKm4tWq
 itpquAJ7pgNYIpN5Q2G+SS0gtYLNKirsTbuJ6YLJK1XbVR1xol1t2A+JQFRLVCZgYQHEbmPf/4O
 /f6puKDBmqsY53oJLUsXDOo9oB76eNaRY6PTSjf3zt6aXaOMpMUIC4dZKRUOxe6jFqnfroWbsCP
 xBtYg3V63MbfPFDKsCAD7o2rn5twVnaNU6UT3IgF/dRIhm97XwbMbcydQ1liHyxbxPSMMqVv8u9
 6hNsVEEpyC9oJLw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX6ylLKRpCg8hr
 iZ+FQuGegCfb9EaG3xJ9f+UZu8KPGCC7qV/qlUsHzJO2TJkBruqG9fmWmkrmDgBDO4LCyesXQU1
 /VTtv8Hw7FjBGrLsqb5ra+8NBAhcXHk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX/e+qVPbXVwqM
 3/mxwZCdhGpXBUj3Ai8PhjaBlnbLjoL6D7yJH03Gd0k0k56a5P3bqfnFWhUMdWDfA7Y2M07xcaI
 lDwh2bVkLFCt6+JZLxjSVW5IkjRoVMoCvng+IziV0iuF0iwuuPkYZ7VT0vrtkCfXRmBJLXgOpJq
 0LpDd73FZOyvOZsegJp4/ZasHickMXq5HobfQJa3lnL0RghydsnrT/bl5VCwh/gozWb0dbhA8La
 3C9mg5IJLFRjqIzExA4Yr7tSOyk8xGrIyKE1y4Pg5q+MWNeVcEEPtWnLNMC6QohA90fVlYyVqy/
 V+y0fd/c8QEsndHSOUS5rpoUT7k8pM2kLHH6H3p2N6lNzH2Wi+qbOufnhAElY9wPw6OPT2E9XKt
 APbKloMX2DMT70WWk4rc/FeX+I+j41uf/CxXxxzF3i5oT48DVoXJ3F2PWVtB8wy5yGU1jfUhl3x
 PLJDldfM8PaeKaHdyMA==
X-Proofpoint-GUID: lzNbYWC-XM_0Cl0UnzHXs85rO6A76e98
X-Proofpoint-ORIG-GUID: lzNbYWC-XM_0Cl0UnzHXs85rO6A76e98
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b004142 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jHVjgif8OWDE08c-SeEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

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

