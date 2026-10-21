Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574780;
	b=BqdDZks5CslFkE6ryk0UK572nbRHIKNI921g8OlmDNSN1DuVn8E2RHGznzy2qqcTaX4J
	 LSLPBEDWwWUtjmJFwgmAIRzwLyaglmVaHl1AetNQU4g7dTWERGJEwkbQAmtvbpfZbhrzh
	 GXNk9XqkHi2mCx7KGX07HbPk5ERMapdPR1VIrG0cxJV7qCga8G6uK4+0SNgdCOkfFctsG
	 d9Mr+psUswe/wLtqTfFgwwcfO+Ns6wFKVpuQJr+Zbhd5bxwUlmH99PEbFxzA7XKRDrX0+
	 VcWCZwirP3XSnvRUKw2B0lySvAiVz5HwvV2qf9ok0WnG0bX85TTeMckAmSVQ3wjk1TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
	b=oL2KXta/yETHa/r4WtOmv2/GkY4SvoED26dvTu9pdsFmlzSB4V+ui9bmNKx5uRMYqMpt
	 ac5Q8DgIiVAIXEuFprUjVG1jcxFuZR/bYDJO8hOCqEyx536kQsTLXf2MR8JF5JxRmjqMF
	 74UMcibmfjHSsJFY9tPzVSs9yNC7Th+dcq2Z2Ch8JMFivjpV49YPoyCL+mvhoHhZFOizt
	 +ms2xqBCIOQeH3Goi29YcrM7tjmN7Tv9Arzgm+nrKHlzvIYIcUO6kaOoGCbMS12mT8Z4J
	 HgiWCEqd321/cqQUM1iWeObW2dCCPKLW1OogmK+U5rl1GIJUKfZRmSQcNPlkXVZwNrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=plflsPsJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IXLV+xap;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D137606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D137606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=plflsPsJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IXLV+xap
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5irPG3018345
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=; b=plflsPsJl/slmmFd
	8laA/Z9kJZCWStJMxXQOkcWyDay+oJ2fEmOmVFeKTM4jYKgyhr3OrHifdPCQYz8l
	mpXyze+EiZJb6FHt78FWA+PuJy0BCL+4klqDsWFo2hKVNTUSs2gNS/pg+VEjqlLb
	WhyqkgAUms2zus4Z4QV2LDQU/PxgPO9dofMjBkbpmCRqDFV978rX03HjsyE8LwB+
	q3U/wtYQtwu1/bI0KkUirRdiaX+3Den2B2EG/NT5iCvdGMqG9vhHvFQE5hMIcEr4
	bWJg2YBpg+RhOUsh2TCM0vcOjOaTjJQrUfPFnRm6yBqvwA9Tq4/eOQoEzjv095ea
	xP7I9w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3naw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:26:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so939858eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574778; x=1793179578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
        b=IXLV+xapULjOV7O7OBpSyhgEPGcmUefGdtFWO9l1jf8zKUzEBCJnnONFhj7L2oDnPM
         casK/2tSzzjYc7G/DfOEk8K2qWfplmoWOO9zGEQFKBNi1nHojvpkQk6JvMCek8yVCB/r
         dq/bwZ6XRbu8QqgOETs79IyKMvZt3gioBUMXSHfdExzs0GBY72ul8Qc6tpdoMhhdIsX3
         ck23GXBBbdbstaPo8BJS58Hnp2CimmG3IAHWZYS9l2euAT4xqqk4Nzv64+DXOleAWxQ0
         +zUBDjb4KB77z2oTlQWxQQFAeoFmY/hLWhHy16Nu96rgkccB4G2QgNgVU7p0d1pao7zD
         WlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574778; x=1793179578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
        b=CKBgUzTwN1QF4fCYBeEfkveni5Rd2tnxmlFYOXsS/s1TxV765KYA13TvBX50Ac0keI
         sdtDfuMgJwP/zlvTxFi0ub2g8pp1CjVvm5G0o4KIj3IUng3WVdtaUeP7xpr7c7bnIJY/
         ulHa1JBFR2a/jzfGzsNx1YLtyEC31rNKL2OjVmFvqvdzC06vaj5EGEiTZ2OzqQvbLysy
         VYQgvW5B3oIJZpIqsjWo94NcTjENVoyHqXJxUNYirFkkqvmpcpwjMpaMWghekbQkHtG0
         vIgcH+1VaQqdNmP6zT+Pe3ab7O9mPneiWIUGBkQLDkQ7BIDwkR29d7kZf5TewvwRXOE8
         NGNg==
X-Forwarded-Encrypted: i=1; AKwUvBwny0DF8lGK2DPncpmlSmRFtw51wpo70qBWP+BOBelFmcipA/wlaCVVsmhQz0U6o56I+ssjv8ps7G2k@vger.kernel.org
X-Gm-Message-State: AFq9FYINwi4RaS3BLuVMK3+96dXu7zfFIqNKRMzCRx9JU+qkIohDHBf9
	Qvswom+snJHLA1HYzPXzgz1hRNKoWS0+Wp7Dgud0HVBAz/4BOoUEtBQGxdxhyT/B4aYYbDMh8Ao
	E+hOM0E3s0y2sWOXCTsxEQg0tyTC9Q+ULiH1sS9BxhzMFV8gHEZFDEKxxhuJHgsLy
X-Gm-Gg: AYBFou0fA2D2z0q7uvUeFpix1mOfXaDMVTHMOrimFxJ+vElF1g+XBNoVPpf5yCKGFF1
	sBo3FFpp+/IWbbb5PAwr+h5qNRZmJSCW9coBHRA6W+tySVcbrCwoFv5fRIj7Yl9QKoCZfoIQ5cg
	D8MeeCl5f8RigYjmfO7H7v7inI+3EyCsDZ8N5wpdXaZTMen2ZrKFB+GLxw+t05p1y1uzyATtXFd
	dL4+a4Y7e4UNEwTPHs/P1MR5Wet+Ujl/3FlThUw6i9sSs3AD4ttr7KDJgUlavcyT7Uj1KBsIb41
	OiK2E7jxoDCU/ZX/AAVYuTP1nxASJKD5MPUh2ZHc5loxCVCberZA1zKOl2SgF09UMlBq0jFtpc1
	wQhmf8kas4hB6dWZFcnFeM73HmNLI7gkL
X-Received: by 2002:a05:693c:2a0b:b0:351:bb8f:540c with SMTP id 5a478bee46e88-3674df47953mr2657629eec.35.1792574777846;
        Wed, 21 Oct 2026 02:26:17 -0700 (PDT)
X-Received: by 2002:a05:693c:2a0b:b0:351:bb8f:540c with SMTP id 5a478bee46e88-3674df47953mr2657610eec.35.1792574777323;
        Wed, 21 Oct 2026 02:26:17 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm6155671eec.11.2026.10.21.02.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:26:16 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:55:49 +0530
Subject: [PATCH v6 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
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
Message-Id: <20261021-dup-sessions-v6-3-578ab52ba66c@oss.qualcomm.com>
References: <20261021-dup-sessions-v6-0-578ab52ba66c@oss.qualcomm.com>
In-Reply-To: <20261021-dup-sessions-v6-0-578ab52ba66c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792574754; l=1219;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=VMGzKTCz/azLzKyF9qh0sYFoOD2oiutFm8UHF1H6/Mk=;
 b=RHAEq1iBAsEUcfhN5ifaU3s8lvFXOfr2CVxuqoWhnvopFuaiUrJQ7klbFFiD8K7RDMfsHBm+u
 5aoeemGEKNdCeJWePMuVPimsjC5W+qMQiJMLN4JEAGi8CTSjmPNb7oN
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX/25jFxHO6crh
 q9mptaB5+MprQ+FK5Iet7agZ9UTBlWDmvtbiB7ysfOCXn2P7IsNddjmWWLfM7hTzvO7BdCW9Q+K
 2a8QIANGUVV7wymr8lHq9Rrn46XjRWYHc/fEGwv2tpb8KhOyuiJ6opt17biKVK1HToYZ8zYCVbw
 0RLedXUEsl7YPlegjytfMs7mn8XjKJMaV9MfWy1w8dcuPLqHLTtn9x4VwVtiOGG2Y6M1tMaen6O
 F9CDNFd0NilwDPURoEd2aoiiQ6NEY9hOWrGPDVaAd9Lu7CKFXEtit4P42+uehXqGULCWLmHZ0ob
 k0ZIACCicF6MTejJX4drJ1TNosaC5yE8fyvy90BrWOcBtcrXusZVdIGo6NoN8d62u1oRjIuvZ7o
 4l0RLvahNvTliRRh18W7RSyEwBXkk3BtBeAePcpYJJQyLmBeybm70koljlq8pcKRxH206ddklhD
 KM2jMgHI6zI7lRhRzDA==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad8853a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=e51zU0WOd6sbzzcJbsAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: XgAxLPGdinu8I9JhEWO8z1l_CDqcx0zQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX20zrcTmbSX+6
 o3IaDtg+h9DuWpXuPg/uFp4KXR+x5q4lIq/C83jHcWyT6NW5EaMW5V7w4c9ZaHH3lDn5GpgrkdT
 p/YEwQsFxSMrdfYOCl0Yof8s98Ni91E=
X-Proofpoint-GUID: XgAxLPGdinu8I9JhEWO8z1l_CDqcx0zQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210037

The qcom,nsessions property was used to duplicate FastRPC sessions
inline during context bank initialisation. Session duplication is now
handled at the driver level, making this DT property redundant. Mark
it deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..e945c8ba75e3 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -101,8 +101,10 @@ patternProperties:
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
+        deprecated: true
         description: >
           A value indicating how many sessions can share this context bank.
+          Session duplication is now handled by the driver.
 
     required:
       - compatible

-- 
2.34.1

