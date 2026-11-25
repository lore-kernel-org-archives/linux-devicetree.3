Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612705;
	b=fXcohOh8h09Ki1Uaa5O7Wsj6GDpFJs4O0sqtrPWfKu+0oJWgbrXg/SeV5QS35+q/2JvJ
	 zY7niwe/HS1xxJaKZ3YAVTP/1OcS/HifsPsgxvNdqDAkVvL1mlYK3mJkOLyc5mQMeQ9tX
	 ykUyHauq9GpGBGSXcDmXc7pbZl9j4mupzxFYlxVtKnUGVBUbs8Sjx3QQJ4DOShF3K3Ugg
	 Nc0kWm7sxG31R4wW+IBkb9G17K/E0M8LhBknQlRscqwvv36tlMOy1CV48tMA5YZGTCDl7
	 5fYGo04VXW+NspU6ViFDt0HDnqfm1ingw2jFvIXO9RG59AVlV6WDvVGBOsrJQLgSmtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612705;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HI7aISuqjbPWHF0PdzqR/2jami8T0DRVhsGnTdgpivk=;
	b=lZm/tMOrAvm8IBK+5RYWnPk0XAKxTv/no7CRdSUhKS8NbsqN7uhIKo7E/tTGWoPlZntG
	 ZqZqPj9vQ79QdZJOIBnd5qGd7bPzeEW6SC8CY3tiYLLpEfFcLDPuMVeM5MikglvSUTqlS
	 TZOpUDe45Xs9AuZG1YrdjTEQYwnHIzcUfov1qQ5v1nRl3D2sNaqGWKgaIZdYzKUBmJJ+/
	 ZIexeJNcSy2wNgrB/5jCp8dfMmiWfC5lIRD3nk1JUwnNG3vKhPS5rlOU6Q1OXqQdplyJs
	 +ODOLGEpbLLVNt8mIhRDz8iFavvyEcR7TyEs9V6+gVbwqXs/3ZIFTshqC8gZqb6PSNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErYnkSnD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gw7d4+bU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DA8606A684
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DA8606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErYnkSnD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gw7d4+bU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9miFG3642178
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HI7aISuqjbP
	WHF0PdzqR/2jami8T0DRVhsGnTdgpivk=; b=ErYnkSnDc7f97tbGOc8/ua+RavC
	BuGi55Il0FnifFEqK6TzDd16wy3HycBJMX5EXrtDh9LWeL/2Q1IF3gPiDmZUxHOU
	1wBdmrTlqrXQUcp3aZlfwswpM7PsPGcZWHlXHDW3Ge0N6QAQPtcA9eHVEqp1Njdq
	qPopGSFaA3/mBAfDr19rZbYamkOYFTqQwRVa0u0hlFvgYKcV+7+/taK6ibhqw1Nc
	JHEsAzAjJvXOu11BH4oicWRoGDwP8TIAuLB/s0t34SD/X3rNr3xe/Q9F1PewefCS
	wSygIo/wGMmVWDSckSrgVaKylOJMUCdw3vtsnoK8UY4isx8hBEDg52L+fUg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2b0fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:18:23 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac74b0596so3903453e0c.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612703; x=1796217503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HI7aISuqjbPWHF0PdzqR/2jami8T0DRVhsGnTdgpivk=;
        b=Gw7d4+bUfH/kor9HeSg/jHEaJDTVTfGEb7yCbNWQ+Mol0uwwHlpnf11xEch92VtWGz
         aIW5XbgTOxnyDzmYwC7A+NCpZrnUc2VMwqKpqJ9Yjtx7gfEKQx13iqQeNpczZhNJRNol
         Q00a0feGNNi6QLLam/rd3yZoDSgWjIuFTjcx54opRm9cZt+DpXvBEpcevpnP9KcLkqIH
         uBTuWKolCM72hxNdtBTv4Pi+aRDA+umf9yVd+7XHnKDf51HTN9Q5CJcARxS2MC/znJyp
         x5xBiqORkYmHEcht18YesSPDFw//8pey426AMVddYKPTWgEeewYhND8YIw2SOrnBihiM
         kElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612703; x=1796217503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HI7aISuqjbPWHF0PdzqR/2jami8T0DRVhsGnTdgpivk=;
        b=LhGxh0EQlaq7K1eeIYfH1sO8yLgB8CEFfHIzf70dN3gaQ2TgD0k1ITfEMIp3qK5I9j
         2sMyPB1M4XOOIDiBl+GSNIDVYgBk/KAevT7A/uhz6YiHaKKxXG/UMQ8HsWd+22G+Km7y
         Uaqhuyj00kZ2h5updZTgHkGpfXEmkKV7c0XsM+SaZq6ZG2dDhUCGIP6JbReuyiif7aJT
         L9dkU67OTXodOvXbFJvPMVYJI0m4Y6UcF+qKAa9zpMU9yv6u5ezoVoUaABxZVeOEpe+1
         BiSxHAxJW1A8QWNY0Aysej3TTCh2eNSI2PwWmQVrpd6OK5xLgE9oFPRT+mmM17y/sm6t
         PjUg==
X-Forwarded-Encrypted: i=1; AL+hErHeIi0sQYD04Gy8iqRSuAZUd+a6DKNnhn+bHwJMnPTt7jZQwuVlohgiqeIKcI3XI8srIp4bwb+UqWjF@vger.kernel.org
X-Gm-Message-State: APuU4Z8TmjKpsAakLQ6jPD+sc3Tga3UERR3ZuiOoymAaVPVNIBpEvZj5
	Bf5HqMRad3kscbfyhQCwGJrgqtXLmPj/70XF7qwGG5Bs8BrV9cbm0D6PWGGXf6VlYqMX6asW6Gt
	5Fn3giedJDfzz2t5+iCsKI16N6+I7VM6XfHAb9VXbwVzoNKVqZHCRbuWHH4xPwE4w
X-Gm-Gg: AZFdTZf5sKsA4eMmR+GBjGdHilZP3MahmoNbeFHVUTptUM2PBvSDhKNXJbK+c5ZFSFV
	DHCsWOQWC2h4gqCexLXwsPS1c5/OnjgGtFe6UedZC7gPCW/EPgSqHRc2L3eoFNxY52jly2LbmKm
	TbyJBfudn0HsO0hSd9Dh0VyOctPxRguRyedhmGI/MYSGQnt8V+paWNShW0Opg03N6NNmD71Ed/P
	twc+sIRpBvwSLVtVv4IjXMdVFnLYXtlUulj+dPuhlaMKleo5YEnHKis+YyjLyNoat1l6ih8o8Ok
	FdwsFWTqcRlfhEyaSPM+bezEfQZRE24ShsdbMhNJyP5gy7+0ME0P/jGUDtyF+CrVY4u86rKbX0T
	WxRF7iwP1xkaEcY37A/T7qtUlVT0PX2ZHPFXfrSoVn2Tx8dT6ESUfjRNaeYjcbm+4
X-Received: by 2002:a05:6122:30d3:b0:5ec:3e18:a188 with SMTP id 71dfb90a1353d-5ee8adf1536mr11257281e0c.1.1795612702657;
        Wed, 25 Nov 2026 05:18:22 -0800 (PST)
X-Received: by 2002:a05:6122:30d3:b0:5ec:3e18:a188 with SMTP id 71dfb90a1353d-5ee8adf1536mr11257217e0c.1.1795612702105;
        Wed, 25 Nov 2026 05:18:22 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:21 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 2/4] dt-bindings: clock: qcom: Add LPASSCC reset controller for Glymur
Date: Wed, 25 Nov 2026 13:17:55 +0000
Message-ID: <20261125131757.1163466-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06e01f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uR8O5Y6ZOet9NXHzM84A:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: ti3wjzN5QN2eEBKuysG6vXGKsIB_GKMC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX+ZAVf7+kI1mL
 CNrYcSDCvuklGVynr0D6GHhl4myNTC0wCz2+koJvZdaGAIW125xwCtUw0MWCGmk8xQ4FKqds3Nx
 t9gHpR9Hbi1UoVF0ugCL/WtUXyqpmyQF8qXSjjyeVPk+xMyDXuSUaqijIch1DmD/Zst3QNFpJr+
 ru3CrUxPIbs414/8jUKLBBQs8wzJnXIcvC1Q966gmIoqfDNTAYEYrueJ6TjXGbWrEJK1Q77DD3B
 /rLHKqKOQXXQfjPTTdVM5FwlFOnESDCwDNKkZipgQBhzEIpsELNZwskN4Wgd1E4LafdXclOv5d5
 kGH6PBnlkcRKnok2/iq9BJnvwI6cAeczTqjSFTx9Zxi9woZAjwKgZFKyQU50wAICdP6mIYToUCK
 5B3EeMRReZsFdxWsTk3WaJPVWeJCf6z/5uaml+0KqM4ZATgZDNvRrjEBkxpfU+qUoaUWHDxFAa6
 oWKYhf1fCuoIkN8earw==
X-Proofpoint-ORIG-GUID: ti3wjzN5QN2eEBKuysG6vXGKsIB_GKMC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX/SPdZ8jecr+Y
 m/EoYbhsH3cqK7RH3wd7aVGwR1B1u8SrtSK0rQOv5Wt1JHXifh2651NJlc9ehBi6huBKKdK1psW
 CsRLP1Kgm8UFZFZvztC3QCriUi9onkE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250052

The LPASS (Low Power Audio Subsystem) clock controller on Glymur
provides reset support for the SoundWire TX master when LPASS is under
the control of Q6DSP.

Add the qcom,glymur-lpasscc compatible to the existing
qcom,sc8280xp-lpasscc.yaml and add the TX reset ID to the Glymur
reset-ID header.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml       | 1 +
 include/dt-bindings/clock/qcom,glymur-lpasscc.h                | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index a25e043ab894..b611f1a8b42b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -22,6 +22,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-lpassaudiocc
+          - qcom,glymur-lpasscc
           - qcom,sc8280xp-lpassaudiocc
           - qcom,sc8280xp-lpasscc
       - items:
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
index 3006b12e385e..3fc8e7313cab 100644
--- a/include/dt-bindings/clock/qcom,glymur-lpasscc.h
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -13,4 +13,7 @@
 #define LPASS_AUDIO_SWR_WSA3_CGCR			3
 #define LPASS_AUDIO_SWR_WSA4_CGCR			4
 
+/* LPASS CC CSR */
+#define LPASS_AUDIO_SWR_TX_CGCR				0
+
 #endif
-- 
2.53.0

