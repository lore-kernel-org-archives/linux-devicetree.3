Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3B9400E0D
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588344; cv=none; b=UJR2HcI/h9iSzHCTSLBuOKToa4mXW8RNXd46FNBq6hcrvf8YGuOFDi5YD/nZ/QWU3ny2UrU9WqlnIpvrnC7/Rhn6SEYVXVpJgbpVPAPBjGF8NrA8EieMypwJyCZ4AgaLHJDJtkdQVU+SIH6XXqOGeGlYZUul9HBkvLynNE7qRTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588344; c=relaxed/simple;
	bh=r0iXaQT/3Ce8ilcGsWZbADm/m41wg6HDX7QrVE7Zhac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bU7TgfWpztvQxugq5cqVI+aUBxHdge/ksI3SojsaGO6QW8uQlyOx8dQwObZ40V5aV4VyotrYEx/eGBndszRR/dp3cI4tpVL3eZ9joAr71yGawV9n1mTOuEhaRXd8LhAhKffvrB1S+6L0ArY2eAfp9JtZcyD+iI1XKTrTjYkXHyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1QgMuDd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePio/xTe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1QgMuDd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePio/xTe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669606ZY794339
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 09:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UO+aIIshUmbb+08s6VrlY4
	7iK0/DlpQNt2mFjVN0azI=; b=R1QgMuDdUz/tZirFCd1wytMVrf+/kwpqti+vq1
	RO82/Gv2olT2BuAaDveZM8bHi/s+Grjy7E/LIqHpQ400ZwiKJUIwgoVrqKfrddSb
	B9qZaxji2QDxS6brliVZY9Iscb/k7O0Rkg3t68ScoICXOelkGjH9jjJ8om45EDfB
	wrTZMvz8n8zXzSLtRjn4Kce5y4DecJ3uBVfMa5Yuyl1LRtW5QonQCfwNNTVXiQ0y
	FvfISkE5u6ZTsU4ECeQ1Z47aqEJeeqs74dU/PZkqOs4MBA6YJ6ia+i0DZXyc/N53
	uxdn3gwvUPhkclPSOmqlHNVASs/TXooZv8bEEDgCQpdqaRmw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydsrh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 09:12:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fdace20927so20194206d6.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 02:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783588340; x=1784193140; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UO+aIIshUmbb+08s6VrlY47iK0/DlpQNt2mFjVN0azI=;
        b=ePio/xTe8eiJkLZdy/1UGqek8hZb+UPZ5uU9mO4mcXZu0ZBGoMd1lZaYQXQysUZRE8
         pEDKAQXsXdUbJUEi0TMEZG8fMm2fQTickkGVsKD+7JYBezhNdnWy2lW6W5oxVoGFgzoG
         pRGACI0GqjFOtLjRh8hcnJEv5Gx32NFjnq3Lf+/2g5IXxDZHiwb/xYtY3ZxL4fRKSdcv
         NRzT34HXsCh+shMeB9CQrttxruVqUk5zOpWZ8rcXEeno3bXd4PPwR5qv4gusRoiHP4QV
         0EvcgkeYHjiKnPKhpww3YWuUwrJ/Ibex8mGGy1jHo1m2AJ/zKs2D48oRlZBlbDXfbEJx
         aOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783588340; x=1784193140;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UO+aIIshUmbb+08s6VrlY47iK0/DlpQNt2mFjVN0azI=;
        b=gif7IzmsI03NyNWYgdb/WdNP9IDdB72uv9Cmd2axc+JZiUTEDdodWBAH+aY52tjrZr
         Ym5YPW3te+cbYPOyy8hdze257KuiqtDfVbUGC/UZR28wflwegxBDik7RObQXjZvqIooJ
         llcmyQvu9kIR3n6UA8B7hwHNVf4ccgL3phwo7gQS0UVPL2Jv98elHdNV7qkhT9MTrjR2
         BA3t9G9v1SYbzek+jbtHIWPqmcjruatYc5YyI+EwuGb8T19JtpQDJO9i4VDfMVtqrHnD
         ryFJrLYj/XaOr+Tryhnf0kgHAqzhhVCqeOVCitWuOKU260MMpRzEG2D198Uh3SD63gCu
         JJ/A==
X-Forwarded-Encrypted: i=1; AHgh+Rp+fyQFlRHoG3WqyzsqliuKbWjq4EDWk5nodnuZK0y40AJRO/hugZYy367w0K45swPEfTR0qQ9AKdnb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1hBRdGn4IHiR1/ooCTjKcmNDLfVj9tsV1HuFS9I1FTVj/l9jA
	taXT3x5Vm9wi3ihs+ggWGV4DBKIXTthlPD1KbBoJUQgEoR/A/ATYL5+35eBnGuKZniUwTmQ+ZCo
	JSOVjp1zpgAG8hChd0XfIxNNFiZoCIf3a0zXbAgRV9mGEeYnNlNidQ50U2xxcKTUsV5xwsinW
X-Gm-Gg: AfdE7cn8p6ptqVd/6u0ptn6r2dqVpkC5HzI1LWz9uFLtvMhf2zpppWVmr8K1fRK+fJl
	WSMKIlIT/5Sfoi3wNW5ezb4VnIlzWtC/rVEz3qbjnaopSRvgbLFv/i6isRndnKBeCNXJlIDtwHs
	8o4iBtldAPrm0Chfztb6IYWi6k9cyltvrY0/vnsf5hDd7PmeFGxt8LHryn1g/36O5DBzMIpjNoW
	/z4Mn/n32FXFCWOliqfJyCLXkqefWwtKHXR6fx+xXQont2n0UlWRje9pGnyTVmi17s2hfTwCZ/W
	g5LmBhtCN1vfbDfC+pUKErpoGfTbWSXWcZS92f0BtwqYLYKIHOO/9z7ion28B31y4++B48Cbusd
	1oDAniXCIsGc6R14=
X-Received: by 2002:a05:622a:244f:b0:51c:7b12:1201 with SMTP id d75a77b69052e-51c8b44bed0mr65106331cf.79.1783588339630;
        Thu, 09 Jul 2026 02:12:19 -0700 (PDT)
X-Received: by 2002:a05:622a:244f:b0:51c:7b12:1201 with SMTP id d75a77b69052e-51c8b44bed0mr65106091cf.79.1783588339011;
        Thu, 09 Jul 2026 02:12:19 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb70a372sm46624575e9.7.2026.07.09.02.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:12:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 12:12:11 +0300
Subject: [PATCH] arm64: dts: qcom: eliza: Enable first QUPv3 wrapper by
 default
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-dts-qcom-eliza-enable-qupv3-1st-v1-1-e9a6904d0dea@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOplT2oC/yXNQQ6CMBBA0auQWTtJKYkEr2JcdNoBx2CBTiFGw
 t2tunyb/3dQTsIKl2qHxJuoTLGgPlXg7y4OjBKKwRp7Nq3pMGTFxU9P5FHeDjk6GhmXdd4arDV
 jT43xgclRZ6FU5sS9vH6H6+1vXenBPn+zcBwfATL3fIMAAAA=
X-Change-ID: 20260709-dts-qcom-eliza-enable-qupv3-1st-fb30cdebab92
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=r0iXaQT/3Ce8ilcGsWZbADm/m41wg6HDX7QrVE7Zhac=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqT2XtXXBLjsU/4gqxqg3mqkCZjw8uxPYYO3eKE
 Xj5szOIL+SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCak9l7QAKCRAbX0TJAJUV
 VrzmEACL5hWuVzFfxqXz9oqyWdnErWtC22Ox/B0LJ9xQQHR1Op4gmgp3q5X1Mrcb5ym8UlVH1J5
 nJhI0H1Q+LC6NJ22LY65I39n5Sl6nlWkyJFJwYfMeyrp84o2uO0uriQqmolQK/atwfv8vNl+CEV
 2a78GUcOHQ90GZaRsT/bPTIab6aAga1+iDv4vYKk0GP9KOer7ncjAPhqIzuJdqvIi0+Ow9EktBB
 pObvZ1OGAEBzRJ1NJwJE5Rr4rY0pueUudV5IdtzUxCrmFxXpZR4KycsHmXo1DeP+OwAWYqNcNMO
 M+Wn7k7YL1c9lqm8Fm92MpFK9i0J4yPN9wNkN1UEHMSeX8AZ805A0EK0UV/FyYF6MbFjjo6ij+a
 EYq0jDRmvhfqJjM91ayXxCveHo6xhFNvlIyQicsNfuqNDwW96BrrLB9He4c9rQah7ukMhLy7NAp
 PdcN7QW7VzTLaRo6sAKb/6yZTkSWwTa4WeWkOglnRtVK7EOofO7C6u5MPkzxCD7Z0lCtGgHf6US
 hS+TGUH0UPwEJJRgkjSP/yLzPjdxSDmOjCcJobrmaxqHPPbGVWSWSFZ044xFFWFByeuJE1Ag2tb
 53IyOKUUpDWo0ylanShuF9w9VB8+AeSAteR90ACU3lkRa2JlxUGPHk94VjHM5hKQhjysysnAN11
 cECXJCSLKxloi9w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4NyBTYWx0ZWRfX8s9p5sSsFQgV
 7dtoHKOP6C4LoLfYLinK7hemFYBVSuONtR23MGj39plfQb+c5ajG5AZyyDVNRCksRe6hj9CAH2Y
 AreklnmGbdVBUkNXs3R+j8TDDefxaa8=
X-Proofpoint-ORIG-GUID: JP8JA-okpRxAFSQvFwpB2U3p4jwYESFE
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f65f4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rsU_kau4JR0LAa4guoIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: JP8JA-okpRxAFSQvFwpB2U3p4jwYESFE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4NyBTYWx0ZWRfX+blRu0EnijsI
 7eWO7kZzgCH4vAtSS3SgnSbBnq/wVU4oxWqbjKxkAqRhZLWjG7ZW42ImKIsGbVjipGvFTY0a5yF
 5NMKqyXRWvOjpunuTEBki8LswcS995IIFEV76Ob9VKdwNKXOiINfjs8HaqXjOQ8HjKlOAiJqxnh
 2sJ1ygMDlWhvKVaFT4g7ysiQ22DM28qOcDrrgetIqi/gFuz+HDdZqSvImenrWabXkOQdy9BESBr
 Pqv0ImLBEhopyM3OQICh33ZsmH0OA3PwOLqOLOONN2tvwQFbJQ9ZxJ+sumXEkpazOj9nuZLvwcm
 crgmb0haFnf/Ctuh/hsXn3w+w6hGOjFMgAc/cYiU2cFU0dgis/s74L3ThM1c6R+R58ytcTl62oF
 iR0CWncUP7ooiNk1EQ0pf4AXapFEgdWn9RCeti+VpHXhP01LXUyA2kCvnBixOF3XOmANWof3Ygj
 /uiVpyekwxzRsjLCUKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090087

Since each serial engine will be enabled as needed in each board dts,
there is no point of disabling the first QUPv3 wrapper in SoC dtsi.

So enable it by default. This is also now in line with the other SoCs, and
also with the second QUPv3 wrapper.

Fixes: 844807e1f89d ("arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI and LLCC nodes")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e..8821d224a213 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1232,8 +1232,6 @@ qupv3_1: geniqup@ac0000 {
 			#size-cells = <2>;
 			ranges;
 
-			status = "disabled";
-
 			i2c0: i2c@a80000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x00a80000 0x0 0x4000>;

---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260709-dts-qcom-eliza-enable-qupv3-1st-fb30cdebab92

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

