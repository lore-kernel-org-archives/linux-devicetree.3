Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685805;
	b=UmzfLBDGunz6wXmlyaBU+9wzx0ew0gNBbao/w4e6i4BtzPgq9P69iXv5SpQ3chTOcADt
	 kY0YvqdEqkcMahBT0GqZayKILFaqz47LKrGuV+L1p2b81j0JtapINPgThP2qmAQ4F2W9J
	 8pnicWvegOJEn5UdZiaxEXyTVsnnIv47s30PpcA6xFJ1Y5IvHPAcfRYKEoAqQEur+WYVY
	 9GTgy3Ng8xxQJ3d9zJs6+EH/4bzlfR2ccD/aj+FQUpti+q4V7biuc6fKsJOc7sVzQt4KF
	 iiX7wJCEkZ+Z9huZNMW7vji+MCCQhMmpxHZ0k/q5hLJ5Y5iilLVKx0T9iVN8VUgh2DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=M/aoa2SC+DkCU84CzIID9inpDxzA1WGETgXSIeteeJI=;
	b=aridXRujk+g+GyirF32XNqIiOZ5TVVz/nVZeokMAygXaNrJ0PhnK7qBu52mgr3tOtPSc
	 ik4XoXksNuwd7aNV4B8XaaXe7jVsvbyGhlmrhualgjMygJEritme18n3DntOpmdBpYMTw
	 2+6ZX8q6Bt8xYin1ucaSXXocqO1Bk7zELs0HE3iaJkYCAFKdsuO4l42et3N/qnOBT6RHK
	 yApZcdqnZio0ov/0oPAZ80gx5s84ytB1l2TcUqjgvqKIgpeRq8aHp9qP06R3weJkG2tCP
	 0BULzh1g+AdQlATuttY180gXCNDLRhZOQW0DGMLpK2n9xRAjLhTBzOHvOpeOjcAbMfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eQ1Uzgh1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="jUiL6e+/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B9060A2612
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99B9060A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eQ1Uzgh1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jUiL6e+/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AvN12594867
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M/aoa2SC+DkCU84CzIID9inpDxzA1WGETgXSIeteeJI=; b=eQ1Uzgh1R3dpWvBQ
	Qc1BxFchNB+lggK6/aSLkCJXgQB8mMrq04s8FkDGJx7IR31VtdrP9BeingYme7v9
	CIwFYaZ+Db4vgpadfe1o0FxIdiy22Avam88BShLDmrYBKASLQsf7pL8NnGyjrsu4
	m/DShDkzCGeC1cK6aCcKuCI1QwrHKQDPt0SzIZokbdg6/uKJ49EXNRxIU0yj/GC2
	puGajCDeUVliAZBV9w7MbU41SSKqDrVwtTJ/Gph800ZP/+jwJc9ZxLcDh4Pgtt/N
	SocD+g5V5g8UzVfPbXCnhyWIpGJlK4eDdS/kYFjxMfKUeNJjJiEmn3uLOoumCaG4
	4cVhlw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sag8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:36:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9211d51dcefso125070916d6.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685803; x=1796290603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/aoa2SC+DkCU84CzIID9inpDxzA1WGETgXSIeteeJI=;
        b=jUiL6e+/7go+N9aNbHo8OTR90sNuZ+AhchS8yHCp33+qWN6GRqKJn17uMmUHCcEtcJ
         ZPXgVd0MKfFtagupSC1MTepGM0P2KuxtcNVNVKR+Hsi//YLu+DIS4LSkr+5/n/Ri4BWa
         v1Kl5w3CU1chNALjSfCe/mY6epSXmeWKdq0F8+lNsOyNbT7PL5tk0sZm+1fWruSS6zOv
         t50EkOFIVx2CzR7BrTHdtJI1ovICHotoScOxMkqLO6zw9Nr9dRxYqm2H1ktyYQ83A0mo
         PIaM6TLRUwLUy63MvDSei9e+uwKvtZMV3O6H1n7yYULlfaGnH7azON7vsDKfS6BX7LL0
         Uvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685803; x=1796290603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/aoa2SC+DkCU84CzIID9inpDxzA1WGETgXSIeteeJI=;
        b=Yu23uY0ygcX1CXxU46f6BF4Tmjyg16Pib5+lcGuzMBB8nAlFpcL2jqFki19KMBu3cv
         tFz631NFQluwYSRSSq+UICSUm3SueZAtBc7J0odzRb1rCb/KRkoiSliacl/b+f5n1e/F
         wGhjfj/0ZamBGSujgP/1qEudEpo8a+Hf0mYGSdUytxXZrZblwdNkKI7uIWpuWV88pE71
         BS2CQrxxabmVoGAEFOQYMtZEgisU0+BjjIahimjYxIGaK8k5Eyz3iUtcOyYEk9ytoDEY
         +acdt9xYaMOcfzuPBlK90QysqJvl2mtx89+fuE6o030uxvr2svhl6FEf5SjmllkO5S3G
         /okA==
X-Forwarded-Encrypted: i=1; AL+hErGBfmXcEl5336XW6xWMARuw562AqYTmJyXuLgPq67X3AoByVFwPmOLaQOeHvx1Aa5MaA95EmERW1mLB@vger.kernel.org
X-Gm-Message-State: APuU4Z/ckk2/crGfLZeJfm4osvHdke4lJg38wpIA8BXTpK8JmJ8RrByZ
	85WtBuNPKJqQreaWoRxv3sc98D3IjIfgY3j/i33oUoRjda0QK5+d4Har8Ow6D3KA50+hWwwzp33
	nbzZF5kqBelHg5D/lLJ9qcm+Lmi43kB/NA0cs4+KA1FAQiS2lLx9EENydqq393tSd
X-Gm-Gg: AZFdTZeS82URsATV/rDWh77JpoL1pyj49Tc4R4sL4kQuNHXnph7QZm2a0uIePUq1EA0
	JH2jdTUE89l5hh4SpVgTKocWk1bvXmLgzwscy5T4scZete62+b5Ot3dFpfLktaYLX2xzmrCddRJ
	ncUBXxUXfFVVWYxLJtpAIMfrTQbiLBv9IZHa2lJDsD+zBshaDMUzUxQ2XhpY0ssuaydUeseWenH
	UwSe1BOEamyQgYAquN1AAJdrP+xRB3r912lyn0gAfz+Gf3DYvoIRCwRY0WsMhzzDgXB697DsRBZ
	9HoCz9viK1aT93wOIiEkjbdkuACgZUwIKoVrTGOs3lzD2Cv0Yre6TdY9zjyVLMklUeE88D5Iyw4
	I1ZFJWONjI7OWIZ99CptmXIJq8D38rTvEvUuxv0DRZWjoaayJ9c3bFwEwFkv6NvI1wHQQ8Txn76
	pj0g==
X-Received: by 2002:a05:620a:a408:10b0:94a:889:5a41 with SMTP id af79cd13be357-94a08896148mr539863685a.71.1795685802987;
        Thu, 26 Nov 2026 01:36:42 -0800 (PST)
X-Received: by 2002:a05:620a:a408:10b0:94a:889:5a41 with SMTP id af79cd13be357-94a08896148mr539861485a.71.1795685802479;
        Thu, 26 Nov 2026 01:36:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:25 +0100
Subject: [PATCH v4 08/10] of: property: implement the count_references()
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
Message-Id: <20261126-fwnode-for-each-prop-v4-8-d4b370ecfd52@oss.qualcomm.com>
References: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
In-Reply-To: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vpHcZaLg1iuY8wj6IMHjWOG6qRHq+3ydzmu44JzsEu8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2UJXfVTy+LhvtNE560ipdr+7qsCNpwsh365
 sHEwfwrLSiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w47fEACiduOFuZ5D39+RtQMC82XPATkIZP00Ln/9WqBR4IAiUKBKohur+TZsFpIJzt9wOSyiKaM
 J6T6Qf6Kf0chV4Xm2uHvg0kLvQffYIqPPgkr399d4uxYBFqMAmnXEqsIl2YHhozmGjHoK/CLj/A
 eUEhj/wL+RE3gjCdm2DUj9G3cWRLJctMBZQzoQjiGyXgWBbPlfXpAqqOJaYEVdBGu9mAVtoV9+M
 m16dtpnDB2JPrDq7YmukkIxiU66d4pwkUaWfk0O8vQXoWs3Zu37knwKld92AXaPXR/x9ABBN5jB
 rUJw7rtSfVGIN/7BCBxgZjVGeNc3zw1TnKz8yKdLsUJRNlhUsKCCv+MelNjEtGjuebWIRlkqGWt
 d10L5ydRJQv7o/CJkLmXM2yrxMHVhlCJHUwLnY/p3lQeUGnhFIo/YxkaV0p7aEP+QAyaE6lIGwy
 3j5IGagl0G9WX/0Jaz3lKs6SdRdmLX5UO7+EEoabQwBvcelQPhNHYe7A7nVfcBcCyEnZzk+zWqn
 mZ+Lv2dyHoDY2yLPXtmGr55DUaLdOyYLbl6XjXE6F/anA61Fw44QakDHCd5c/mbTR3noyVzBUxx
 s2eTq5/lj2J9kriliFpQukiddxj0GPcE0x2hIlHDvsAkI2HX3ZPofSHrm1mHNkCIyxPaW7L0vno
 WIhmYhAYEomBamA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07fdab cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zSBz9IY8uK3Zdpgw7pcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: upGkDZZzFH0HXvUOvBgpv2y7_FjytvpO
X-Proofpoint-ORIG-GUID: upGkDZZzFH0HXvUOvBgpv2y7_FjytvpO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfXziNU3s9hl3CV
 SbZGP4KHKFFuVrpMuwstNEKA3G7Eds8jXRR/qQqHe0IHhPzwYyBdveZ3dw0MPexoo0sD4IoK8CI
 dCML2wBGfVb30baFx0NYrms1ikSC3Yyp1XEppOeHGsxfOlAZQ4cBfFT5YY15QsAtQMVgLYkvu3F
 RxTaKJrxhCx4iXVsv7ATFOdLOoLPLTZ/fT+sYiWiJkpC57IGsJY5su2KgaB921kQ4a4MODf3RuA
 mKMJ+6QW4rNOKr26evB3vFpleP8lXDyWiqxB6UlYk9NdzPkzNzAGfiNB+jI4QllNBVNUvFeWqSO
 TcA05hSvApAw2uHhZnP+OQZTDZwIU8bS04NY3tQIfv+r9CrPI0xcNqDqMd7HDaOrUbHkaz2ilKd
 qEusKRkGvVp8vZtc+6zLSuRNZW39GZn3++YfQPgxk9eYp/gF9brIzoeynI+Y/F3W1elVWXHymOu
 MiXwmGSyYYQn8B96QPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfXxO9ObH9uEuLi
 Nz8YTaXwWAJ7NhSZHV05fZ+O7yLlZxl559U12qh3nNwCu9FFGFdQkKpg0f7pfTjlfVD50yo27x3
 GZqiWZcdsV754779NSs4uH96pGaOaaw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Implement the property_count_references() fwnode operation for OF nodes
by wrapping the existing of_count_phandle_with_args().

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 00349e78fa51455696d0b34ee02ae55c20cb23d6..bf2e8ada7cb32d28437174b0cef1fb5958f2cefb 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1233,6 +1233,12 @@ of_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 	return 0;
 }
 
+static int of_fwnode_count_references(const struct fwnode_handle *fwnode,
+				      const char *prop, const char *nargs_prop)
+{
+	return of_count_phandle_with_args(to_of_node(fwnode), prop, nargs_prop);
+}
+
 static struct fwnode_handle *
 of_fwnode_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
 				  struct fwnode_handle *prev)
@@ -1774,6 +1780,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.get_parent = of_fwnode_get_parent,
 	.get_next_child_node = of_fwnode_get_next_child_node,
 	.get_named_child_node = of_fwnode_get_named_child_node,
+	.count_references = of_fwnode_count_references,
 	.get_reference_args = of_fwnode_get_reference_args,
 	.graph_get_next_endpoint = of_fwnode_graph_get_next_endpoint,
 	.graph_get_remote_endpoint = of_fwnode_graph_get_remote_endpoint,

-- 
2.47.3

