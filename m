Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178835;
	b=PeKYs5XgkmigeQVspD7Jvk9WlDQAVT160g3T6B1ctpj9Z1N6rL6uKDNVR+f8Gp6qRiPL
	 ejwe+4MfSkRaF7WIFuBpKLkGnH1ZT5cxQgtzNPsUHo+fZrX74gYuuc5fsgoGF/u/BPLm6
	 EzvUHd4QS5Mrmq6GCeSBxpaJI3oKW4OvQaJf7jz2LCCvXhEPkJF4SPV/F8D1zG+1WorXB
	 LqURN7hTcimiP2ln8O9SpYBjYYSdWD0MRSgfFjRe1bvfmx/F4khXnTbgI8i9Q5XYQ4NvY
	 dJi0NnJmzP45TUYG1YwzZw7h8pA8YutxAw4mPA7OUbabuCE0BVwA9I1y9eXA3iOrLNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=py8dPHZrFwq8TuV945X6CNLxL3dFzwBxVrNpTYS0mGw=;
	b=3NmYk/yR9Hh7/CpX870k1UByKcEmaJxyGgtAEf5J80L/wIG8OK981ciYS1BuOXInjnxa
	 1qg2NdnbJPcddiUK4/RXlhy3W04PXcAN+/FXOOJtrnG1QBASHbfMADXiMF+k8neCHl/tA
	 RkpC/S2NBEnGh6+3XUBrnC5AIDMs8na8h/kVGy4aeiSXpXINvkkTVQ+2MZ1IOcIARqupJ
	 l4RJoyvvocA8gEh6zNZ6lTcsTx6pwjznK+fiS4p7a7IBGOAz5GlVZ7xv4L3seS8O3OD+1
	 l0rYhD3nF/NOPO1XiSYVB+q3iwaHO0pUU7h13NU+UTzMoRa2IZJPkm71L+mzF0SA5UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mive7c++;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTaPAazi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB2160A263F
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BB2160A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mive7c++;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTaPAazi
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKCFar91256942
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	py8dPHZrFwq8TuV945X6CNLxL3dFzwBxVrNpTYS0mGw=; b=mive7c++G7f0aeIi
	tU5sPnck0E6Dn0U0OiTsRiS0pijJUrn/kt1DYm2ucaK4Td9V52HxTozQdgyD+eRe
	KrOaoBuFOocyl4fw7G8PYK+4a8rh633EGPQjcfLAMMSX4zfSTNBZzf1OW4tda0LK
	56DQb1FByrUvQO9KQQaHI0YfXbeNIyAv9tR3HClJlVU6wvTGlG57x2kT9phtQPZb
	Zx1Mr+HBK3VDye1BiuxHjovr5pMiM1S16VPt/lPRxB6+PZHUW+rMtkiu2M3BOhX/
	gzIdnQQ6TefS6g1GNnaqvxp06SR8hz9vDLEZJTq1OQhQ61yUCFP2XUEenZlv0y81
	l9kLOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykr0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:47:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94975041698so490596585a.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178833; x=1795783633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=py8dPHZrFwq8TuV945X6CNLxL3dFzwBxVrNpTYS0mGw=;
        b=hTaPAaziTawMx/3bwS/ZQj9VcYvl1rQ/K5iHlrH7EXkVTtM7cLUtryZJtRahOkOsls
         3+ePkA9/fCO4WZnV19dkTQpdNWLE5yq8xkSkv1LqCdbdvBMMjqkVCl/FeFJrSFlDIS71
         X60Z7VG39ygrQZZ47ryPjJJBuqYUD/JiVFgRYi7U/NxyHcKgD1JsT71N/6lh4nj39/OC
         suGX3RJf8L7DibdouA8D0YYc510Tj7dBchLSPp5Gp/O+wlx9LM6fzNBNNAhL0nre+g1B
         1f2GLPUQNJpVIfc7K9iKgK4MWpV5mvHyzcItAQPPc8z14EwJ7mm0TdZeRMjMPZpRj3DM
         WwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178833; x=1795783633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=py8dPHZrFwq8TuV945X6CNLxL3dFzwBxVrNpTYS0mGw=;
        b=kuMVxwoHr7I4tVKp4iiCHe+QobirUV3sqw4UIUIQ4oYs2LLxrB2khINdNjcmnxx+0U
         j/OxGF0kzcQ8J9hclej+a/3oeOcuaLdBReSrFQlcgHwUGlHYXLZ1csb/c5pnZqYDseRn
         uGzhRig5b9N3pKLr4Gjlu2LFdeRp8MfTE3CWovk/BlxPTLhBYoMA+LTdFTHmBS9LBu/G
         mWBO+Cv08TsOY3rXYIsqWCSYIvUsgRvWPDJjZeICNQgTCCEazqBn5YFpDsQD16tCO2cg
         0l0T/su5/UhCkLa7/sqsbLHZb1F3L8Y+lcxgjKYb44mOYsTvnctMU5TxC57CMD97G671
         Ynpw==
X-Forwarded-Encrypted: i=1; AL+hErFyAnZm25s2H2GpcDbPtdcNS6wRWSMmA6OxVXeja7cdBal0xAblSr9QrN5L4BMC6WEiy+P5TG+JoW5k@vger.kernel.org
X-Gm-Message-State: APuU4Z8wCBEucXmSOfY/2iQu07oq39+xkaZWJ9jHs8NygeVEzNsjoW0Z
	q//jfyxyx1Bel6612ZcLZsmfi9YpLLwr3Nf09qGRUlSntWwQfGw6hL86TsHhY3JPeedtg/qzabA
	I5a2VgA3tcv1kGWI4ZouRVv852ekT33Spd04S0h648Q9XwQgTjw429LXmGtAfUxhE
X-Gm-Gg: AYBFou2OWTist/JBctmujoj3s+4mTaAmAEILlTr2FV7t+CKc04IDN/MEltEb9X3znP3
	RuNk47x0IsoZvpmHpEwL77hxywYbXFhTqh/CQfwDCQYa5ypn/Ks6jpMfajFgtCOBCLw2RfzrOs/
	1uf+Y3L5mbZNESYtdwzKEhkPLIxea2nCx+Fk6ir45w8je7GETEdkVw/sIxh/1/3G61eoKH5rUHz
	8lvMQ9E5/r0J1brUECM6fdllLw9NObtuIZRBYG0L/ADurgF5l4tpR6ymUjgpJwePCQfCRH+1den
	9iArlx8sKTPnvaDYibjx5oVfzIo1x2qGHmFERXqmYw9RHg0OZS9VTgUt9bV9J5ggD31l4hXr8X7
	osQaYvbiHfbZoe/3d5+GXwo8hCW8jOvyvlHfjySz8E/PeIJ37767HHXThYgTQR3n+XTXz+HK2ML
	o=
X-Received: by 2002:a05:620a:1310:b0:949:6663:d1eb with SMTP id af79cd13be357-949b35c8cc9mr701839385a.21.1795178832666;
        Fri, 20 Nov 2026 04:47:12 -0800 (PST)
X-Received: by 2002:a05:620a:1310:b0:949:6663:d1eb with SMTP id af79cd13be357-949b35c8cc9mr701835085a.21.1795178832194;
        Fri, 20 Nov 2026 04:47:12 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:47:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:45 +0100
Subject: [PATCH v3 08/10] of: property: implement the count_references()
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
Message-Id: <20261120-fwnode-for-each-prop-v3-8-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1JYcW0VA6RP94DZpVTOyfu+AL1354zezooQUAMBcxYc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE48xRvddI/0N7DCqZkWBsifUkkdYI+c5zBJ
 vU46Rr2pqCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBOAAKCRAFnS7L/zaE
 w6eeD/9FM2LleDI1LmF4XiZNQpXqyZxO5p6eXgpPVBhfUheIYi62FaI39M4l+qez4yLaX1zeW76
 dW5RMQie6Acezli2k0Yi/wTU4YfuHMlF6+veM8HQ3hzUZ4g7B6G8t24Ht4ev2QXihHfsRWFwJNb
 R3pQgTB5yJvxikhi25Lx1qC+CfEEPiVtYnCpqUOD7lGUO4Owx76xEcPSApmYg5g72g2jMElnBfV
 z7Z4pXKK2TEQ0JBglqCht8mZidYacc5Nrj0dmq2FwhE/2wGsvo+rMtVYLyKSOXTUB6s0AskLgnC
 wHMM3CLaz6AFr2BNJsfW0wlCWMJz4xYSPDcCctad+ketRddAWj2fh52mvwg2Zur0AmLjcDdy4mH
 s9aNWlzMW9/dPV9Gom/S15MII9bJLhnnxbyLN0k7pWLKKlvcftVZm3Nqm3A/NBlvwKY+LIRUSDz
 KU6TK5tSYq9qHpwJ1SQIu18hQizzuQFho7vVnrMZ0tVHpzMGil9lyVcJ+swqhrVaQ1L0YVZUKzK
 Cm0Ckr8DsXxsFY+emjQNA0TgPfS/pTj8KrlDc4lgYo/C2/u6o6HBofhaGJmu2VOjUo9X2Hk2nZe
 iSPEWlDeeasUNsF9rFmP5VJp+YOsdh/STmk/ZV2cU88FA/2rBSZYsbX257OXQ9PueqaAAhhbX1E
 AJc3sMoEMzH8r8A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX8C3p4MjJ6bwV
 a7jpqyD5ahrFhQGNf40/zWzs2Kr9agLbvJv+bWxpyol6jemwdRDvIPZDOp3S9RPbQ4i/cr9byUl
 TAMDLwL7GrjO7SytjZGfMoGsoFifMzU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX/7quoDpCH9b3
 QQPwBaWzDJCKNql0b93y6cNKS7uyYlj06vuxkSQtu1uoTqQc90VDYIy4Q1ZeMAoGlcZROnfKmZv
 h4qtcYrsBB4yomVp7gF1VwlXlpzPrHVdqCLxb6c1psaE/6G86lOicXpjH9BGr17gyD/pNHzJ6GP
 IKODpsPWZjRMfJ2DFH8HjwkYRwZl55byzzdHrDBYZWt5suqcE9Un9Bv0Xj2rC/l6y7g4l4ck27L
 1/lXtVIS0joc78wFK89+N6pgHHaBnvRVwVQKDJ3A7lZOOAEuP3B2u0k/scoDzxMlC+5GhpCPzXO
 5Z2pYgLzzmFz6OEnUMY7TtqlAdQn8obLz1FxkXdwfGKpQKXZNpvIcQhkwzXWM7TwIYtGL317web
 VlheIxJkE7s2rqlCSkkSGjJee9ZVOs86kajpVLKEsx6NcC6/mGXt4ilNAEoy95MR3n8KP007Bni
 nVvCdh1Gk7nxiFG3X3w==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b004151 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9arfEEHKbLAzJOUiRygA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: zoU7w7ijkf5coi0wd6D_jIyf-pNs4bUu
X-Proofpoint-GUID: zoU7w7ijkf5coi0wd6D_jIyf-pNs4bUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050

Implement the property_count_references() fwnode operation for OF nodes
by wrapping the existing of_count_phandle_with_args().

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index f914f0475e0be865afc9753fda5aa40a08a10e25..4b18cfdba802048364dced99af574a415815f790 100644
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
@@ -1749,6 +1755,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.get_parent = of_fwnode_get_parent,
 	.get_next_child_node = of_fwnode_get_next_child_node,
 	.get_named_child_node = of_fwnode_get_named_child_node,
+	.count_references = of_fwnode_count_references,
 	.get_reference_args = of_fwnode_get_reference_args,
 	.graph_get_next_endpoint = of_fwnode_graph_get_next_endpoint,
 	.graph_get_remote_endpoint = of_fwnode_graph_get_remote_endpoint,

-- 
2.47.3

