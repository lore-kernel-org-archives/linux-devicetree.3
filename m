Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC1A4772B7
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848814; cv=none; b=bUBMFtjJhDTAFKsKzYo912kaVEp5a2dUqqZcSS+Bwka7V3eDQTV9uMt4vYby2Mq3MZX6wS6WTCZDx6ddDfOFHmMroOKcSKFUcV7bGkmwD/d/ZFpGNiFV2zwBdGHCE8N540+uzxr5H01OsR00hGWeBg5QPGLlu9hqZXwSzP9GA1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848814; c=relaxed/simple;
	bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdTng8WHgQcFy1BT56OJ4T3MDXvHtu7fcnmp2mkmbiR36ALpSX54Sg9ZVio60DspoNKfZy3iK0Q4/1tKhJc0twcFBzbNds5v4YVopnIS2CLo/J25cg3X6QD2Q1a1WU4BPp4sIscucpm/lomFpyBVteSwmMtWq5fPRiUQqgkhfv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0YYt6f6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DoZBTrwy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0YYt6f6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DoZBTrwy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbng0297000
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=E0YYt6f6HIevJsBd
	GX+u8SCGPuzsdlWqvB+D6oHOcH6IqkT4tR0SrbSPCCZUrzxSyz5FCUnziW4PMhFb
	GDCb/MeAroaXuVKWw2H+tHiPO5lIMnJ4UoInLTLJcLJYf5PdDGheWJ0qYtL/e25a
	0n3AomPNFaJ7Q3Xk3bLt49KAdWA4PhtB5Pic+Wzy+nUp85lLqqFGEALELmgEP4By
	LQ93fZwhV2Aew6E7RORb/QGVzi0v+BzLvO45c+99GiDZeR374uexa7CZetNACcWE
	mdPs95IYFGJBkZaZpVHLiYTRA5xsNVBO8A04kn5MEhi6kP0oqxnzdOkoKhu/Ut6l
	8jSAPQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gam6fh8gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:40:09 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-456ab1a7f2cso249762fac.3
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 09:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848809; x=1788453609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=DoZBTrwy7hTJKXTtWFA/tNaLqfN3pNhCSkWALgBY5fufdELrumUOhSVJhNb3XZMNha
         P9tq5sX3OAIs0LF16jeJp7uiLameFmhhjVNgVgBfvy4nfu5AE1UNhwQ0kJrYjeL/U7YE
         TOVlWNARefOehAleK8n3lHUT7nN3wznglWby/mbDmsrzSHXqtxZAypiSqKxhhhU33O9I
         nef2MCOBKRtk0DFm01Qs3T+1dzQUdnfbN7Q376s6sYWpGzA0bKaMPXVvt9LGHf043D9t
         DwNRrCezWDtqMUY3HwbbX8UIQVFMRxfINzFxXwsLYJenqKxsPoP5DMcgXLZ9m8B/MYe3
         Huhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848809; x=1788453609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=iIHSVAT80dgHMpJ9GtwUWPpuOpJdoFtaZBVMjyDGuF4OtdZnAq+JVDNWh3ONdFaPeU
         AC9EdomIY0I1s9/TbVqumZTtVOqUACaqjyfjRHpvz8rjpIHMY+Fyl3N4oU9k9rH0R7EX
         CBT0RyVrdVZKbAWa4HQz2k8JPTCJ8sbLvxYsPgiDk6Qhu/iL15scpZX9GnhhOzawq2Cw
         iFI0aquulhIJteNUFLtJoSxooNptWp+FrYw3dlgTNAPFncgq+zuFHJaHR/bQvsbXp+Va
         qT4YMLkhYMjVdabnV/03x5qpQ0CsbFjlcvm/qj8m2gZxLcXViBAZJwNln7ln/clcGJ5s
         YdIw==
X-Forwarded-Encrypted: i=1; AHgh+RpDxWNBymnlhngC36XlUTkk184Dv3I/7VS1XIaAe9zJbqzvEWSoUi2Ahv7/eZYBaNAgfjkVJgmUuttv@vger.kernel.org
X-Gm-Message-State: AFuF++nrWTauiSzOBpGedZOXs6FhDbO0re41DFOLkdIuINpUH4eOpTLB
	DiEd4PoLE+/D12qIxNTMagv20dfAUJzL9r/6YoolTZ6DdPQTcobb/AJe3D3O66E6HCMQxsw8RCc
	8+D4pZO/GAtKTd2jdSZrWfNDxYDIc3u+KzzOeOn0uZoQULgDSKVpptJQ8/8ZDza9s
X-Gm-Gg: AR+sD10Vd01RUm2g0Zfh7IJKAiJKdfyCMFAUQOIhYpzE7wD1DNySDyQYiCXy4Y1F1BZ
	cZ4DvXnDLDvIXQxXLUtc4ZhPlUAKASJnX/iDYrhoqihNyEqnID6ez9WGVOGz0RN8axDexvia+E9
	ZyiZHUfid+hNNorYvh0xy57PqU201NWFZV4QtY9CAt0JB2uqCQAm1f5TyMor/ojBPKIycvgn6t/
	L2A0wnQ+WTipKlNQ0r99y8+oVgMOFlhOquLqfKq3rQdCGd5dtTobUlDw4MlnTCUl20ApMJQvRvi
	W4tPfgoejDJkGntoZvm0Q2o4dIKNNkDopEQWXAgiBFaUsDcOkc+l2Ku1AvMa42axmTVWJGIIv04
	RYUCb/isVg7u2zlLccn6ib3JkMcFmJU6jmtKMYXqx1NZzdscxC7PlP4hiq0k/EsDEXwH5/OzPkk
	sQp4Pg5j8VSFjolbK4s+K/8D0=
X-Received: by 2002:a05:6820:208a:b0:6ac:b6c0:2c09 with SMTP id 006d021491bc7-6b1a035992dmr14794085eaf.1.1787848808674;
        Thu, 27 Aug 2026 09:40:08 -0700 (PDT)
X-Received: by 2002:a05:6820:208a:b0:6ac:b6c0:2c09 with SMTP id 006d021491bc7-6b1a035992dmr14793990eaf.1.1787848807924;
        Thu, 27 Aug 2026 09:40:07 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:40:07 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:13 +0530
Subject: [PATCH v4 12/15] dt-bindings: interrupt-controller: qcom,pdc: Add
 Kuno compatible string
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-12-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=922;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
 b=pBrBLzP9TMaCVUrFowgcMyIoJfPSjcRKOakAZG2f0A8c5CHxwMisU/O2fCHoDFLEHgcn+UTEU
 fPRnjvgpBYyCB7YGXQ7XCauoSDwHWyfAeGfsWsob99y6XN4Y7qQhGLh
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX9CWLK7lz/GfZ
 qsHs4MNte6ZzPHIoWADEc897lfZ2AR+8BQBOqDkDKLAl1UdJGGDtkI4CGbDQ2lkyK92Ez1FvNOm
 EWKI8PJgcQ8r5Vobch2fjv1Xuea7ZR8=
X-Proofpoint-GUID: q5SO4j8aoMrkNv-ha6g3AXN2OMyHgN8g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX2Y2J0sT6k71H
 7Ddp/Zyy9XSveidNv7e8Q46lSbhwxOfh2njFeIkmUcp/QXTKdANtOSIjGcLI5j4Oz42az7LjPvY
 gZxdma9P4WBtrImATpgR8tjjiaxASOQm6NdD7Gio6Hw2w5fyAr2Ok056ut8TslV8+H+WTWGgmof
 bCExTv/TAUMIWi7eDOMsM6u+L36wzOGJA9Qebxg653T6NTUpGJmb2FQ+Ral+yTYjhf83sQ23Brl
 ewYXH1mFBtLq18Qj5fnR6k0TXXigy8Xr1JiYFeMx3rhdLj3fkasrYxJIfTqFGsRIvFhHRIM2/IR
 EGO0Xz6CqzmobAbZU8BcXQ2t5ffLvGgnViItCcbwFdfgAAyexJGa4PM/SGvdsll04UFVAuOxlHk
 C1npmRaZJjHOA+C8aJARt63/Blcqeel2jph6cUXoH7409E7ciB8mNmwrIwnK4XGn0ict+zTtTvM
 qcVIZygZAKilvq+xGkA==
X-Authority-Analysis: v=2.4 cv=eIgjSnp1 c=1 sm=1 tr=0 ts=6a906869 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_KRvd0mH2JNXacczCDAA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: q5SO4j8aoMrkNv-ha6g3AXN2OMyHgN8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Document the Power Domain Controller found on the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..518fbf6b2761 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc

-- 
2.43.0

