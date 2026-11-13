Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584843;
	b=Ik6zLfmOR4K883QEkLWpn3l+QJME96MRK97urnd/VSOuSuzsLWALPZJJDNKae2bNKO/c
	 TUX07AhocG4sADaPmUz9SnD3xJOXho5p0wXYfIEARUajvsT5VkeORm7zJ07giDG5sbU5i
	 RdrVfontoN3k01KMT9wzYptA+LXk3i5dX5VH+2lZO0kRrmgoJ+edv1T+2KMtEATZrFHVc
	 O9kzVbBJHPSq2R+W2LtKRfscm1ZQaklbTMckcggydspxwwGs+bg/14bUqLmQYYBBKjqb7
	 mc0nnU6UxxpyB+kMBZ3FF+VoN9p2O1l32uMIWP5NeEwAY7EhKCl1a8EJLbaQJ9c5p2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
	b=M46GVF0FdDee8O17ZE179WoJagthkB0IAQnPhUTs4kz5m/+wBy+7qazf23icIZNWgICF
	 D6hUwnCBjeplYIiCJZfBbmSpTQb2+h9YIr89LJ9DzaD6GDYkliVYxdoe6yojTzsZ2NTbL
	 RlzE7ndjxUBZYaxBMXlFLd55Ov6GFgx9aEdgINX6HotN9bRIrNswUnDQ/LgicLAzIRMQ+
	 lJ3lAOiOjK0317GAqFnREMZKFjHmkyXoSjHGPd3/3vjzdIyLkglBtMRB48Z95PTRTTl8B
	 Jq8J3O2k1uZDS1YsFodiyW44VNwXA1466tFG6fPfQMsrt6tYcJZpvMCsF7ReqJ6MGyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nJiKbz63;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PY99stuA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989E360A3813
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 989E360A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nJiKbz63;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PY99stuA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRdsa2638653
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=; b=nJiKbz63nrH7eqQz
	wdXMpjuGEjlhZ7hbYqQRb39wOMYLeEqaIKz/Jmcbzx6gRZd3xIw39AixOvbvDExY
	oHQ5gTXF93dXWfNR7BcBvgHNLn9md3TySS4Ou1gEvQTPV/DSKRPeuUZviXc9jTo3
	dXM8WGB63B/wdzzsS78gHb2E+AIHyW33DGH9oY7HsprE+K0+20hYo7YsdsVzunhg
	qckwvl0PHFhT+x7dlgfAKv34WIh3Qdm0bnYR6Wcch6Jm0rtJoIO+TsA1RN4niVOt
	HTGW4uPnanjaY3PwqJ6sixJzmJHY2B8R0ALcC0pOB3cBSWhYCP5ReNBr6nzaVT9b
	0S0wWg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r9wpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:47:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so122852085a.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584841; x=1795189641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=PY99stuAq0sXknUhF5vC2SxcE9hdOVKYxPLc2WQmD9QhcmV3SpNH0OYVlT/IGHMbpk
         Pvm8qqUx+KzOi4qoCQZMopd6T7tpoVFlNzMxGKX3+j3g9GwrApz4OgAJCrZf7MqNbhTQ
         tmLBJdKd0FvFThbWa1kQTRQXQyWRcQSoFmTpiCe8tiEfmBQxeMCWXX2UCtmfh9a62j5V
         AvRheVADm8Vo53Z3AoqAYp9s+P+X32y2MtzoeQCOAyCaTxy+awYNO4Afa/OBsN7D9/F0
         wcUhrVIpRVMMY/ymsWuwhDE7LhGCsxZXAlqGgFutcCN3I8+seOsABLvvOXjLNTJqbpKS
         VoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584841; x=1795189641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=imFq6wtEkWK77tukVM0tMx9fDbMUQ9zZa+dDm7fCqINe92/EdoJ+JYdfGiP8WuhN0A
         VYn88GQOURLKRCl+9K4vmitSNeDuM+GZiJWStB0xGdBmOjrob86SasYKlQKj64AxfU98
         5krRV6MGjYvAeFBP/NBT3ZI9A3rrlR404cMuwqLIoV72bosAY4K2iGDuFfw6TjAbD1PG
         OX1K40WrLX5cWDedMb/TsDIan7xQJKs2kZeNOunb1ozbNIrtzEZH4mbxaDWlSfwHXI9N
         f6sWm9LlyRQY1t27UH7DCc812eU3Enci3KZU9EN7osH+up5WoGjuXEw29pl15r3TdX/8
         pz3Q==
X-Forwarded-Encrypted: i=1; AL+hErGDV1Kk+EcclO9udJ/uLSvAzkPe/GND4p+ljyw9amGOl+MrELv/0il04CeBtTQeSu0GEHnlPy5UrEdP@vger.kernel.org
X-Gm-Message-State: APuU4Z/NXwVdAv2+VSMMmEfjk9dwa26bprYGiSzspbDev3Eal98FViU0
	YcebN4gtgCU2Mne/rmWpZ+ePKlKdIHPcEXvixGatwHYNgGAQqBOuVjNQLkVNdndh8EDgv18C0x5
	Tum+eGDR8spt1IijwdzSykZkGqiii+u6NwNxk9RSWDc9XX//lHYYouHnadnKpveAl
X-Gm-Gg: AYBFou2KcFEDlUSGN2QI62qqZk/fg9uwg1KV07+IcDvrQ2ZjgHiokO+t3qdRRSI4EnI
	Casbgv1E9b7J+WG4HG1/svrX/rdI1yZ0WoVV7ZyxbgsdRhYzGtrdu7W+bNTCVOxx9nJ8ff4tl+6
	l2ejUHO6lC/I06yyfoSqeRJx4XoRdKYaXqzg5Zn1tz7KmF2gXJKMnoCZFkOwNMxIOXarW+h6dlP
	XLR5hruEexEmCRVkoSFe+zH2WMmm/aVvTQa5fMds5QMffoNmvq7rg+qWG2IO5bqIbBr1VFUCOyy
	t5rd3a30xJ+7PTKC3KehO2zE7R1VByzplI6ofbFwUHyTlYkBfaC8ekjWS3ba1PGga29TB72lOXA
	ZRYo07Vl+STdUeZAQSr8UyCx17bOinng/vN3JTbfC0JHRj8NL34MKVfyyXTBVLJlOanzVZFZvmL
	Pv6Q==
X-Received: by 2002:a05:620a:6f92:10b0:949:5a71:8b5b with SMTP id af79cd13be357-9495a718d67mr138855585a.29.1794584840489;
        Fri, 13 Nov 2026 07:47:20 -0800 (PST)
X-Received: by 2002:a05:620a:6f92:10b0:949:5a71:8b5b with SMTP id af79cd13be357-9495a718d67mr138850585a.29.1794584839734;
        Fri, 13 Nov 2026 07:47:19 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:06 +0100
Subject: [PATCH v2 06/10] fwnode: define the count_references() fwnode
 operation
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
Message-Id: <20261113-fwnode-for-each-prop-v2-6-4edc23d5cf50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uLLErtVyyBCCkNg/MASZUF+mZGiOHH8LUrLC/RKjXs4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD32k2a7eEkOl8aZQKi19IGoZf5y7QX/pyld
 I9O91GNOyeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9wAKCRAFnS7L/zaE
 w2nLD/9yKd7FFWn2nO+v8p2f3Abfl4909ZN/0SbSIbO8rtsz2EQaIYF6bnYIaUircw3bP3KYmX5
 g9eATzci7IIF5Z+uE/xGl13aNmKk96nVRhqoDLyc2JHfnUHo0hzTtNZKYDcY4ChonfmQAKrwYrg
 ldnnuLTn08xgUzcgFe8yWa8vfpbsHWp6uiOfjvsx3pPaIXdIIb9c4QxEYa2cyB0Uo+5GeUlWQbT
 XRkFqxQRU47PbujSH1F587xSWtQd4Gg82Nk8HCYzHNI2+Yn9ZgjuHi92QCJNkrypjtUUfeohopx
 VB7TFLXGNRomzEJ8gOmx9ij8b3UBBeayg3YFcfDxqM7onoemn8L6rUM4DOHzw17CiKEe/xAdUYu
 fgCMxpyvqVCWPkUs1sSL55PFsKBZ6/WMx6XDdpcmYUAWEpsNUfNtxw3BWoXh8ItVQ6uMj21tWR5
 byMbjuZZeCRqjGIcuiZfJO8zzSqXI/OLcBaOfqSF0XtsoYS6cOq+7g5KkBcEoHUZke/ITrFLjQ2
 7PcGa7KcHcZFAF4RkoZzE5JgiU+H6xIxT5x3YSCpskCRx/q5ehF9CTyQN8eHn8abX8l9XpJiAsF
 FdTbvYMvNtYkVGQ1tyBlv0iG/Hk3BvkRBaUP6PWdv8EAkICiHyJ32Ug0IuuA+6XlgUCg/rlwHQk
 y4iEqHfgHog41+w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX+DKERU0x6NWq
 b/ClOqSMiVVGgIecrGqDli3lOSf8p+GYVEVmD1WEckfVqr6e4a8ZWWDENQLuW97wXE2gUvNvMZp
 8CR+KK11Fj638fH4CDZIIMHJCS21DEgZuaNK52KWRcwkTawdChmEXLuyqzI5qSXmZ/Q+qZecUtP
 JFPXpxtxVEKiS/2ynSmmLO6YnrZRrjPr3R0uztZ7f9cmqY41UWImCY/Kw/M8JjrZB1wo8j6G2L2
 y7jR7preiO44oRUMu54QgAwZJLNIunJqb9wEkyiLK5CSvbEXy8TLHkwhSy56HaGnFPfEXQzBvJW
 eAq/Kk4ZDEdKqYPdKJFQk8Ya2rjVQ2Cz9A+amEkpbhGxuwb/nzMC0v9FjU5ef9aLL/JHVZQJQb6
 B2F/j9d//tkmp59E6Z3+ViOVyMiUT8ahP7dulPvrTFzvWMhNOvLYRG8MgvF/fxIDcXrMRnP/kJL
 a2snUIVbdsYiwtxS0Fg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfXxiR7W9/t6BN1
 e4EQO5oGpZHAViyoYONv9sBJ63WYi6AC3OIheCs9wNmxUqTPOwjeoCLHzE/P/zoQukgnVlJbbDr
 hgjCyRBuiAjIT35AdlN/g+/smDhrb7g=
X-Proofpoint-ORIG-GUID: pO-blEPnIadl1X2mX50SoLcJ1MnsPq1o
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af73109 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=pu8Hlg4PHyDR7New1bsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: pO-blEPnIadl1X2mX50SoLcJ1MnsPq1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

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

