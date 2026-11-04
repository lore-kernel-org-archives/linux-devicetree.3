Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801080;
	b=rqREQq4e169fD/Y8fpNxg2oKQ3fwCz3lx2bYePc0pgLCwGz3hqggWorj6vG/JPmxwNRr
	 xqnkvVTKPH0e2lHwkJ7Vhm3NIqR8Ax1ZlCyameJ3wbd5Q0sN1O2Y4cHilNK9RSfbQ1+Eh
	 nslQDFteoOjGQuoBfZq/0Ex9RcdrUEMCA1wShfzdAEjCaQq2SOl75yooDcEEoQyxRT2k9
	 p8YC4spUInKISXbOil7RDXEAjWj/GTehuJBoTD9MEmks0Vq1blXttwwv5FZ24O0wnEWQx
	 6FkexK8PqHQCgrmpdlxb5JXjWn8y9yeAZ5ceqKnkmiFuJVCmFtZXgkVtFnqcS21K6vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
	b=Yrxoc08ue7WhkPSbWxbUGe29INmj/ioSzO6ZoOCfaj3I4nyOLvAM4YR7wQfMra6Swly5
	 q+lBmfX9uyY7WEi4QfPCDD0IXOua13mh01LZwiY7ZPQOf7JSzctO/snsrWtChqmkRPg3h
	 VPhjoEFPl5u5QXtH6NARJtog0rPIqpMb78ZJfYOeW96oqP/k15BH6ODKE9QcVPx6tDlSt
	 INjb6JNlBJE2lpMuzlNaCrdEMsmWnQUXi+Eh5aWz/AH2r0/T8+z3XdZprjUek0GAOwdC9
	 LSUv+IGT812MjOKQGHDC4OIzaiSsEemrlSFknMBu4/hmZierU9AeEgtgruFt4kwgnIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cCpwgcqH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CUJZ8iST;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAAB606EEAA
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEAAB606EEAA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cCpwgcqH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CUJZ8iST
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZues119370
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 14:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=; b=cCpwgcqHhX88zqxe
	wKpSvCBv5dquXNMbyzsRpkUZKkkHfISr3zrtgx/n4+6juick4N4OY/MXhKeXLaWD
	97DesLv3ibhadPjc61dojFlEetb+3q724OGWzkhy1fLVQFyjuf8J9wb9lar3Sxv6
	qLtGuiDDoGpZdGDmxWmqhCHno2Ji2YMdQzo3JjUD74A8Xbk2pvBamVmkWzba/sqB
	XJsq6dJIIpDVA9ymxqpSig88iIp16Sl4HicVJNisjPRNS8XJNbP2ueCOP0A63c8E
	Bfrz3Peu1JysW8OEh8myUkzbUFp49cW/rYLq2ucaQtaXEY+N7BSXAxpuYiOgVr1M
	SOtMig==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb0aarc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:04:38 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ead18311ebso156154e0c.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801077; x=1794405877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=CUJZ8iST/IZ1aA+BXnnHifNjs7YAwZKkmI4xfufD/XuOAPc79wncl1x7CeQJKVIqex
         xApdlPxfV9JCAwvf2l7/IUY6X8fY+VsSmIratxVLVVC8kWpVMjDrPjAjda8zd5FC0FAC
         H06gENNgTsPrb53R7JR+4M66dML+eNGPm+1KLQa1mDNRBm6TPO6uVipru5wycbxuhEZL
         gyLU8aHSbprbaLPGTe9jrjXVnr003HVVg1favCMw2K2o8RjQitXwEqAaY3JEkdCnjz4S
         oNEmLrbApQTwCw9eyemlQD+UbtSAaq1bH7Zf/Pbm8glt1Z0QhW6+0d5ywnEo2ai1q1oX
         XNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801077; x=1794405877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=J8Fy+alsdVHTnNnRhXRXYtIKN7iOZxh/rMsQmNlv9abdM1efXvKbptq8cq2O6ho+KQ
         5E8Q4MJo9ZzUNB81m64hDZSggxHawBltZxp6iJ3SNNeFraZKivD6ixIObgzsobZHf2hj
         TBswceJ5za6POxpaAB7992MK6NQhLOLvYnzIMx9s2Il/AAuvN79S4B/z8O1YI1PpeAIQ
         R+iavY5Vm5pa+jurZzHRp0rL5jiII12e9Zj1W2UeOvOtXtN/rvb284biHtVA7HfF1Lkc
         tKF1fuLyYzmetWR+wFxIvL9sxkWGkclTB2JIyehglE2+WdDliVdRdYEtV3ubF26QfcWk
         9EDw==
X-Forwarded-Encrypted: i=1; AKwUvByG2UeTOVjmvTtR5BO6zW+gFlqEwQ7EOhnJDIR4O1F2LshEm5xeBe2EmZDkvfIpayYSUdqGMjkRxC/v@vger.kernel.org
X-Gm-Message-State: APuU4Z/LVrDb4tQVsQ+6u8yfQK10ifhDP6pcA3vMwwGiGdvhgGU7acwT
	xMZq4nGUTDq/R3khdh8DVE0DHJjdXCtXbel3dnb6E/1zxowHCTaWVZV398LcnAW6+++a/cGeF9h
	RRtj7xWYTw4KrBTS1HXmxFI9yGCvIqLvkbjxZDqpjZ0M27LK+HiAiQf1831DlGCad
X-Gm-Gg: AYBFou35HQvuZ4O+obPl5qbm40kQ/wYouiTmkunDLuSlFyErRMwXTbI7cfHn9JGHfWk
	KYKrm40WNWp8J5JtnGcCEGPxJXfPANCWDSLDPCH+rtPepuksUT2njGnqBvzImoAS1//+Ua7+jbw
	2Oh9kvB5AnGUfrFaAWnVQ1UXeqQBadLODsNbLsB1/7UOKnYEoPu/rRTUtL0+HL8rjxQSJCTXRJN
	gYgIH+n3RAQwRRFs+eCraBzklWziLC41C67fzUYrCmw880g1FwwSej2E/5JXShUCCx80jDqpkR0
	pBGLJju7vbcd7NVYtHl5HlDQxv+Fyq8ASS8gBwDC1Pc8EJjIfnZfrApG+jz77o+bQCN9P6liXo4
	mf/N7KCiAkDSzKnXXJJpUpyfE6qcVdUh1N47gXEoVAaAZMeLLVLwZiaS0bAqnjFidonzgoa/NKW
	+gsw==
X-Received: by 2002:a05:6122:218b:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ec6881c31bmr6419431e0c.10.1793801077433;
        Wed, 04 Nov 2026 06:04:37 -0800 (PST)
X-Received: by 2002:a05:6122:218b:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ec6881c31bmr6418906e0c.10.1793801072076;
        Wed, 04 Nov 2026 06:04:32 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:48 +0100
Subject: [PATCH 6/9] fwnode: define the count_references() fwnode operation
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
Message-Id: <20261104-fwnode-for-each-prop-v1-6-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uLLErtVyyBCCkNg/MASZUF+mZGiOHH8LUrLC/RKjXs4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztS2SsNdvowGbCSji4kZOTwDRHFzVi2ScCTm
 5DN09+/VD2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w440D/4vJjAqKGaTW6L9NuB+kiT9Z1j8j6GncKaGTKchN0TnH5ydAEKWi2Qizwxyo04HcaKr+HQ
 4T12cK/xUvEPrxrLPLy97ZpWxLC21qJ8sj6boM1JlVC2V+5QXDq6339woLssxJ7Y6M99mmxGNK0
 UVXhqSSv9ju6n+VLIppKzuq8CuwgL/VzXfTB7aHz/Cd+Xsz6lX+uaTHbSXBUKrANZ/8mc1Ah4xw
 LlE2LnTq7wisxno9g2y0vYQQIjSRHTS8THzfXWP1S4wW8tgjV1Pmq5QMK//1ycVjqLfir3viFE7
 Ff5OJTBBHCIPAMGZD0VdZybYCipsP2yjNt2Xhg6oFBqu9GpuuyiZ0cBuPFlWI3AwbCyBuM9QsVR
 eFk7uPyVIeuDQMf9MKYHvjKHoyUkDCJCc6p9uaA3hHhKcwSapv0I+gfJE/eojzptJZJHKvxyNuG
 +lG49XDNmu5UG/YjkNtvw8oay7kbYHBQicu7eEdg0fwqfiaDIm61T7X0PQvffKbI0/5Okf3t1Vr
 nKclDroDVSiQrwB2nDXnE8RP4n1FAt6bjHO2txCMTh1Oox5VR0B9mqCeH+xVxBJ9XFUPD637HRS
 yYvDvMriOT/0YdbwaG+p/rLaUxpahQjMVuGXSPkPEIzmD00ie61X6oRcCr74MhpYpDJ3ZwS6fzb
 fczhOO0ijZqWZzQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfX0hyLRY3Ewwn6
 6SysgNyVs3eSCNYzFg2+fDZylCKtS7Cklff8JV2SpY/pOY76XJHwfbwVaHz2QoZFWG7zXgMISpZ
 pIOggEk30krQOEsNGLG0HAilGWYhzDk=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeb3b76 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pu8Hlg4PHyDR7New1bsA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: ifugWENGZ46TUcnpkrVzFRiEWT6Hgg_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfX8Wffo/bhBbsZ
 ZBM7hR8dsc7laGWlz4lH+tbYx8GgCkWBHaIgLsAavKUja8OOWbWqulJFo+JNUuNJeBezyVNwUOF
 7r8+oA/X+YyzU+Od4j0xEpE3qqdBjwQk6ko+issykqAzzVEfdrD/mhKxRI10aC0KtNyVGRczEnp
 /XP/4JBU1Qth4jRq6fYWCASV8FgqrNoQjPZU3tfrEMhOkzAXzIr6nM7FIGOO5dC2L0U4Lh/QtP0
 NORCBay5wuP+fXCzoj/gGgfs8JfyrS3d36AwFQYZDSK5hwnNhfGU0O7fje29IBS3bcTH0cJl1c1
 fuppS/DJvS6+ncGfYo47T54AwGWcsF/024iJTHadcOE/yLZMEjmM4RRQFCtzrjgHN+0B8SDMvI1
 XO9bstRdWTVlk3SE09U3pDM/DVwI1BhGvxZ9tld6ZadPLeczzJMHNoF+/3fZl9ExHzPX/+hvA9O
 /hWys6RQTujMY9tiAPw==
X-Proofpoint-ORIG-GUID: ifugWENGZ46TUcnpkrVzFRiEWT6Hgg_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040056

Add a new fwnode callback allowing to count all references of given
firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/fwnode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 2d7e0b9245d445d473c7317bd27058abe5750b40..15acade60564ddb5f5a48f2235b626466d77dbdf 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -137,6 +137,10 @@ struct fwnode_reference_args {
  * @get_parent: Return the parent of an fwnode.
  * @get_next_child_node: Return the next child node in an iteration.
  * @get_named_child_node: Return a child node with a given name.
+ * @count_references: Return the number of references in a property, including
+ *		      empty ones. @nargs_prop names the property in the
+ *		      referenced node holding the number of arguments, if NULL
+ *		      the references have no arguments.
  * @get_reference_args: Return a reference pointed to by a property, with args
  * @graph_get_next_endpoint: Return an endpoint node in an iteration.
  * @graph_get_remote_endpoint: Return the remote endpoint node of a local
@@ -180,6 +184,8 @@ struct fwnode_operations {
 	struct fwnode_handle *
 	(*get_named_child_node)(const struct fwnode_handle *fwnode,
 				const char *name);
+	int (*count_references)(const struct fwnode_handle *fwnode,
+				const char *prop, const char *nargs_prop);
 	int (*get_reference_args)(const struct fwnode_handle *fwnode,
 				  const char *prop, const char *nargs_prop,
 				  unsigned int nargs, unsigned int index,

-- 
2.47.3

