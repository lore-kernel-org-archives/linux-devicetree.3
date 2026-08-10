Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29138413797
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376540; cv=none; b=cSNpTxGbFM5yiNjlY/LC6LFtaNEMY9qnVI3eA3avD7NKtj1GO6s67NnFfE22WD25tVxEcs714UdLoYjs3IJSOw++Phu/z6iIjZEF1cUlf88HcvSUlLsOQQv835uNCjidBcTsh6y0pkW9mYalWtvqLLXpAm8u1b+fI1iy0avnN+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376540; c=relaxed/simple;
	bh=NB1VGGbjbuOxIk5Mw7HUiu/hvGDkUOwfKdlFHlZ7Ols=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OOoz3mBivEW0UBWjm4uAczgRFEsB/77dOtMpDeBu4jTrxfZKheRByOSGG6fPqALyuCfzJzZ7lWT0TgkZThCpcDUn1h/6oavqMGyv1faiaV39czaHvUnr4d3H6LNylSrUNqZXjdkJCXYfGQbLREaYSPFW0YRkS8UX+zWr8BYDKO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1sP4ybl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOGONjvA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1sP4ybl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOGONjvA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWNZU2344971
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OxKMXPPwMwKGvDo0ioQdxZL+9a9h+gbyqaNwhVID2zg=; b=B1sP4yblbzOduPve
	iSSvRJzvgNVdCY8JDaqMydOS9IKFXwgyoG1k2rukfNtSnXkRSjpvRFWHb4YFm0sQ
	nWVvlAS8wMC3VuIawDssRKi7FcYM/HsoEQ2/ezyB3YQ4LLDgKNp7ldMeHFAmLLsf
	siNRlYIpLthmjoEjj2NF49ipzInIrG+EztFqnTvfP97cMpZiLrFKLDVecaYTIepb
	9SlTyrUuBxFyXEuYozPqtm4LjoSmQRcYdID1Yd8KsnF+0zsYyk3eRsD+lCQf7W3p
	Ru2BvhQLkv2/RnubtVmdhZce7vUhNN05tKxHxqfk2MZ6N7GO0Pz0KSmRcKUIj16c
	uXoNVQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xubw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:42:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso27944431cf.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376537; x=1786981337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxKMXPPwMwKGvDo0ioQdxZL+9a9h+gbyqaNwhVID2zg=;
        b=jOGONjvAuANZrQpTRf6Iq7RFw3iKLXBdjOsUWDtU1CynMtgB2CSvXWXZVkR0aJhCsV
         3WKWS8PZ9fuMbx+hGyVrrTRCxh+smrZXAufsAsIst3toIWn7fkplU55/aVS+0aMP2Jem
         mjE4Fb8D97DFAcDJYHOxjP2EbYrNFhHt9n0CE3Nbe3Otvgl6VMm0C4pHJx0+iEeRk05O
         0zeqrMP+i8gMpDRGX+8N0L326ZbGb9h3qpEFlV6lqlT00zd9srO8cVnys2lFqilBY2qq
         aBtWSumkBqGxY73k1IbocKW/pxg+SApjgOObWvO5GhJ6UTKHF3OCuOg01y1v0YIq/R/+
         tUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376537; x=1786981337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OxKMXPPwMwKGvDo0ioQdxZL+9a9h+gbyqaNwhVID2zg=;
        b=kYY2QERXXrdDsD81vQcsKEp/j3KPWL9qTb1O+9zaO5JeoGjrZk4Ag7g2vTYTf2z3RD
         8TYS0Yo9s3DprusqxUWR4vMBLPKuKpHErQTJyuTJ0XR6ru7dgEh/z60ZB/JmYOG5G2px
         JtjxVo6a2nCeSH79qIuagswGubdMhmWxsxdwsQHWK2fkOPTIfVDjUFRXnszxzRa5vbC+
         UMTJ4YqwmLQA8ldZd48ZjAgiVXsM6DX9zchhWJgS9b1aQC73+EfbGGQQoEaCuB/XVVcb
         CiYD1rrZV5SCIt42YBgPpJ7LiaDhTCpM9TKOn7uEc0RBLe5ono2a5zgLJp3jLQJfRLwu
         XrIg==
X-Forwarded-Encrypted: i=1; AHgh+RrH6ySk2jf6yeGhfTtyan9q5r6bgGIIwN5hR8Z3U+X4XZoMW8gotoQjff3VeUqfFlP1YJd6YbCRhaA4@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwaojis41dqX4W04+mZ635ofEoEYQitbP7U8za3BbVJiIN2G22
	qZKpg7jYhcUog9npkMh2kC+C31QArBBfvg9xWxaMwlzy3A7nL1B126h6hyHxB4oAZqkPPqegfPM
	RWMh/xDZJaLqFE6JVdotYHzSN6qZMvrCcXClrMz0TL1cU/2MSYDyIgI5vT2vwbd4b
X-Gm-Gg: AR+sD13tD43aIEid91dyhDXgsk9PgykpAiXZeYmxkpDUS+NzCKvAwZErXXUVOs2MJlv
	BOU0t+P0m0/haPK/09fcokYfU7YDd++ii6Dli4FHDaywfAhAzeo9ZIleFUXeEa4JTH7+TPZ/u1r
	Lv9xmPmWHiOBjCo2ndAG36nI1c0qx26j66WUcdzFIdxwC0xDcYe67qUp+kYcGk9I9/fHo/0TlQF
	YFGbtV6DFjNlMgZf4HR3pbRBA+7N+en2khHN6moZUgbpn+VLUlV70rsGWTAseaGMAgHChwtL6F2
	49YCq3ihVbtSMs0X3e18SxyMwwOOosyGjUIAlbEQz5c1QszyKNULpCY5EAXhIt6sadY+nuWD1Rt
	anUIrQ8VUbq5ANq7DZQJOJefuPI3f2uvd83bfXOV/XVWjNkVuFCJYl55OcUi7kAooC8LncAegMM
	FnLjMbLX8zYs00tg==
X-Received: by 2002:a05:622a:1454:b0:527:f0a:ccbc with SMTP id d75a77b69052e-52d18e6ee99mr257126641cf.18.1786376536920;
        Mon, 10 Aug 2026 08:42:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1454:b0:527:f0a:ccbc with SMTP id d75a77b69052e-52d18e6ee99mr257125181cf.18.1786376536013;
        Mon, 10 Aug 2026 08:42:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:06 +0300
Subject: [PATCH 02/10] dt-bindings: usb: ci-hdrc-usb2: allow the HSIC PHY
 as the ULPI child
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-2-e5f93ea76ffa@oss.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NB1VGGbjbuOxIk5Mw7HUiu/hvGDkUOwfKdlFHlZ7Ols=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFQBGUr6d17A5+31t5SJIcxfjs+sTCgcn3b4
 0l8511XhQuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUAAKCRCLPIo+Aiko
 1W9vB/9CocINfSQYnk27Gf5su/THJJGCq7QRj9tRZuzDC31t0zy/eyaGi/RXGdB1S1h+vwmBjk3
 r+PKXXgB3nfaqiAaNZHsFQmoqNkVRZajicGwipkCsEDiQzJ4j/99Ui5JCrIPzJQsDeVc4wqf28h
 a+NcKyVR13lBq9YdKMmLU8MGZYO/3bE7MB2fuIn6MmsZ9AYnIfgH7mZfPTq8yYe4nI+lAR9YK7B
 uaTO9oAIvJS0rwBKkCa76gqYckqSYFjYSDWBVj31cwTqWh4Yx8Aa3XmV5VoWcv8i2ct7ZZmN9Lj
 giA41d8vYvliv7yjlbs/AvZcyf6R1hgbtxcxp5GIit1fUWGk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfXyEljlylJJVgm
 U3QZ0Q8uK1k/JZUG7CE6LUkdUQ7HGyI1Qah23hU1k6MBc9yC5kUGF6lIkyBhpMhsMX8Iy5gugN+
 vjeSMIvNDZ7FXN5AY1L3QvRd0MXTEzQ=
X-Proofpoint-ORIG-GUID: RcpaK9XrAaUcpAt7s09sQr53nQ0GcyWe
X-Proofpoint-GUID: RcpaK9XrAaUcpAt7s09sQr53nQ0GcyWe
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79f159 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=PYw3GZkS7KwsNStVb70A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX8QpjVjJgbyVB
 dtkdZGveiRyw4RetBbj43yk/M62OzLRfaINLbe6RRXmIiTEbUtup2MA9Onql1qsRGP1U24F9LF4
 92oyMPVGp8p0gcINjSX9MUg2hR+rq//mnqtBGOzvgjFsHhbfEWj7V9zdyuL1gufJ2hXs2VPZ+oV
 zvrSNCe8JM5fGpDzBWz1oVPMPOnGAiq+EuOoAqXcO8VG2i2mRz8Z/XedVSZv3MnoFozWAhKzZeS
 bfZ304B+/UiJnvsbKfIn9XG7LbVuja5uF/YXPjLP4/WM5B3/YpD5rxbrYi+1/PWMUWkAyCD4Tkp
 aD4+DGGjlrPavwIogkcI7EUTtRMPWjlkA/4/odlHihAhGn2VEg88cO8z8maQWEMZegUOKhOw+ud
 DguZlPL+MMhUCq4VB8sKtvDEZjHZb7PIuKjrWZu09RiCN8vphn5P3l2d3wMuId81fk4XfBE9fJ7
 y54EymczavRdzTxDWnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

The Qualcomm HSIC USB PHY (qcom,usb-hsic-phy.yaml) is a ULPI device: its
driver is a ulpi_driver, so the PHY node must be a child of the chipidea
controller's ulpi node. The ci-hdrc-usb2 schema however hard-codes the
ULPI phy child to the qcom,usb-hs-phy.yaml schema, so any HSIC
controller instance fails validation with bogus clock/reset/compatible
errors.

Allow the ULPI phy child node to match either the HS PHY or the HSIC
PHY schema.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 620b564914d4..97ebf9e031dd 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -83,7 +83,9 @@ properties:
       "^phy(-[0-9])?$":
         description: The phy child node for Qcom chips.
         type: object
-        $ref: /schemas/phy/qcom,usb-hs-phy.yaml
+        oneOf:
+          - $ref: /schemas/phy/qcom,usb-hs-phy.yaml
+          - $ref: /schemas/phy/qcom,usb-hsic-phy.yaml
 
 required:
   - compatible

-- 
2.47.3

