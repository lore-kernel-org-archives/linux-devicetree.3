Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561838;
	b=fZ0WFN95aTVwUa7xAMrwffWQwoVi1feIC1/FDP6I5pxa98gL7+DsaTOiU8TLDFVeD4T6
	 HsgfvfPHdj69+phVG38IP4Y3dVnQLRTfrImwamy+MkxO3wAxUHCasNhDLE8gQAvsDW6ZU
	 kO0RvrDaQ7dkgcOJaUdLldu1SjNHTckdxp/4D1WntDEEFQQTW72ipdgTbK2vPVaHIEbWS
	 jVDdB9kAqX9S5YBHLEQaS/UyTpfAhQ7XYHKR/csTjbH+cJkSHXMp9QnY5VPg7wePaBK4b
	 MBjaX3pRNplqnA3sR8iKFNPPWYK4p5x7+KmiIHZk74SmeAlZQFV+iph1QOcjZA3Vh8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o/NQUToHHAS7QHkNUaSYHDSQzMhgN9dZj/LQE1+2g38=;
	b=QBFmvkrim54A3UYzGd2HLV/T31qbAFgzEDuuM65scC0uPmLkYYIrFKJTjGcpmQA0zp9/
	 KSMEutcZHKjByO9yqr88efIYTs4xYdTjIFqKzl8GjFgo4vpp8Gld0y4VCCN97ECVdtIvY
	 ugaqGguvmnsYcY+eU6jq9YNtKKEOqHXAqHUQWE2LnffB7sUKSyNKDR3eBU1GZIVTVtD8q
	 8Y9CuDsXQ83VgJ/PefT7XUhRNg7Ck0OhcSdf/nJAFWXIoLiX1HSDA9mQmH3rnuQ84vRvG
	 TPOpnLduRF/ojCrW9yQZuRLU9R8WwjPZ5HzJh5bW73HNlY9eiq3iOSln7NZPm59SUYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPkhEpS1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ht56nYnA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A02B606A32A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A02B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPkhEpS1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ht56nYnA
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VB7c3652900
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/NQUToHHAS7QHkNUaSYHDSQzMhgN9dZj/LQE1+2g38=; b=ZPkhEpS1uetK6yjQ
	lvttE82layk9/4/5Qd1qwGY/KYHhBmNtM8Tbk00kFrJweTJtK+1kKB7y8Nr+m+dI
	dvn1szx8s498bqmiHNsrGdmGTmmogUCGuy7a+inMz6o+ucyg4oFmZ4FIc2iFqJ40
	pxqAaI2/JK3kg3bmDHUUL+sL5EXeUezkDYBQN1T5286PwmVTP8k8m5uOWZApe4Es
	f7/3sSfE/Xk77UFbf/B+rxXGcpqixYsYXC6uBQxfiN30zrf34mAdlO1h1/jswVU/
	kr+OgNaRm47l3NQUToL/vqJTfaADd1eqO1HswywJ5KyjhUEDDIHlOLX+r3Y3Ssdl
	uF34ow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwacjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:23:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso22420285a.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794561836; x=1795166636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/NQUToHHAS7QHkNUaSYHDSQzMhgN9dZj/LQE1+2g38=;
        b=Ht56nYnAcnjmQZ1hOYUXp6s4SqqDw7Imr8GC1e6GiysEa/Oxlmog9l5Kc/lQpUvTSc
         sQbQB2Rbf0WSlLsYY4aZPCKVg19Kc9ikwSQHLowgp8Mj6UkgiOxDUq4ElMgDAsvxnI3l
         O3kRIjvOtI9YK8bLIRPDJrjaDL97RIxVhYB6q7CA99whcuuzd74C3wMP5gXlUqHuFMym
         eUCwxhBqRMwjF6EVQjGcdtdC34eQbDnlk5L1qEbzGGHouGEUDKg99hjVrs3G+iJlMWF5
         Y6EXQcaGqovzu19t7Cp/R1SHfLb1yH7n9k2w3JmfG/eGAexdCPjQ1TJ22h7AD2Iu+PXj
         X7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561836; x=1795166636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/NQUToHHAS7QHkNUaSYHDSQzMhgN9dZj/LQE1+2g38=;
        b=ybOJanpEmBu0xlZRRN5vrg559/bIgu0pAmJacyfcbRPHCVZkx0m5wHH9/bJtzXpgPI
         U/HzCQAL9L/spIPXoJB82iq9cM+ijS8LcT1i2T5MfESaqQ6mS+LH5lU/HvwfAdcnbqBC
         VkHX0qz6BBsf2g4dVPim81lx+Qf7xQmPq6PqFyQeRYPLAYG6UQW+tjGRHYtG6eif1b8C
         2iLoZQ1THuGcERznTMzU+aimYoYNSi3JrXW9xYKMHd/c6FCnk3c2HWtXa42TBXxDYFvx
         jW+ztHgEPtc4bDxFY2avjeoZ5YYaulJydaVXTHDJ51B+MrluUGIgjvbhLY/sOMz+xzuY
         7PWw==
X-Forwarded-Encrypted: i=1; AL+hErE3V9cc1SjTVA/wKIOLEYESynJjRM9WKWvFTWeP5vvVRiIVrvYb7GcqZP3xjeULLtAI9qZWA5Wzmbrr@vger.kernel.org
X-Gm-Message-State: APuU4Z8nBYQCUs5upy62/Xd5QrEFn0yRr6IBfvTINbx1284X1bvUbfMZ
	WdRGjc04r+PE6B5D1N/lUFesmz2rSdQVyjfR8YYZNR3icaa3q7o0Si5Rk1+y0kHhVErWo/LKk8x
	wGgxKpjQB70CmQ95C8yQ1/8NBiqgkmovuR5AVU5YmiOPeqXHCzkazzbTIPfcAnFfG9YAl1tAY
X-Gm-Gg: AYBFou1/DL7HT/ER9mK6zsk3usoavFt7TlhxMUg3NmCXN2sue7cDacOkwY+sw3Q6Nis
	0W9bxUWeEB6c8h9nwTXk+jd3QyFPhAPYWmPTpua/lL4YiruIobjdOZrchA++u1i9MW4eW5sTJ4a
	XCQhBnrcE5iWadOZgjJL0WyDdx7ARe3xDrxWTqY2166HMPVN4awL0Sa2tFeKDaQ6JayvSMlGMf+
	68VvD+xZEkzIwGjnGl8/1SYg7ZxhqO9YtKDNYAEjjaFqLCo5zhxE7PD+2NcBsamlAprW4MBR+WY
	01aWerpSfWFFcwu91lU3mbwcbKIOZ7kVhVzRqwuKApWKOqoAXYQWJcyRW3e6HwGjKg4gSog+ZuB
	ygVZU3ThiTLCtWNez+nCmAbSto6oPWMvN5ckzK9uTPq1tNQ4wc0i1iVmByURbRvFeYLBC604=
X-Received: by 2002:a05:620a:230c:20b0:945:c174:3d3 with SMTP id af79cd13be357-9494bc92906mr299601585a.5.1794561836490;
        Fri, 13 Nov 2026 01:23:56 -0800 (PST)
X-Received: by 2002:a05:620a:230c:20b0:945:c174:3d3 with SMTP id af79cd13be357-9494bc92906mr299599185a.5.1794561836026;
        Fri, 13 Nov 2026 01:23:56 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b427ddsm70563166b.43.2026.11.13.01.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 01:23:55 -0800 (PST)
Message-ID: <36d49272-f164-4bce-8203-622038d35e8c@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:23:52 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] interconnect: qcom: sdm845: Drop the bootloader
 vote on ALC
To: Michael Auer <mick@yoxcu.de>, Georgi Djakov <djakov@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013202611.3070778-1-mick@yoxcu.de>
 <d58c1d15-49c3-4740-b24c-17b850b3ddf3@oss.qualcomm.com>
 <2f78c7a6-5955-4d21-8f61-b3199b493840@yoxcu.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2f78c7a6-5955-4d21-8f61-b3199b493840@yoxcu.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6d72d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=DHITo_NZqFMnFYMPA4wA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: uKPNxRl4W9A9wm2_6BEmaSZAKHhAtGII
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNyBTYWx0ZWRfX8Oje5jF6XW7L
 FcsMJjOgOCXaentgDTdnqMFworJ9lcqO1DSd8Gxyfc5p2EbcA6UkJqQ3NITaS5hSc3AnjqyCDpp
 CCzrMlUCEq0EGhM7yXHK7g7LzAbcny3SW0l+9s2NtrbkoSuESfYjQPuGqbd1/VwC1F7Eq6B1AB6
 85X6GPJTtDjN7uLLjVkc9Cdd9XpjH3vwYmkMI0gQakRy/gG6wKem1HXrnseIKPikPfChjd5oy1I
 j46ijx4NnNTEWbndBZPhBFiqQKllW+GRxqgIzPY+T50xV2E2Sa5VQ5CanrEmzDY9kqVmphtU8kx
 bISg45VCp42L7zWZFbS9XI0au7shRbvKerdv6mkWQrLxaVyHUBlMLT9cIsGrLCSnceJIQbNME9+
 sQJqZiD3PedYwONQ9HsieDWYuqbZSpQdCmwCedpRCxH8W0Pn0r01r/jhPQPt2meFdYbzAH+a3JG
 3pgqcPF68fGnp3PbaVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNyBTYWx0ZWRfX8yi376k/gNbF
 2+WriQ9gp+fdggp7PQ0/yo/RZlTvx4ulO2ZOFSsQrSgsWyvOAYXvW8vYDsmSnuP7O2ZNyHSDzsR
 tloGxJlBqUk1dOmJ8/MkRx4dB1SGfQ4=
X-Proofpoint-GUID: uKPNxRl4W9A9wm2_6BEmaSZAKHhAtGII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130037

On 10/23/26 10:02 PM, Michael Auer wrote:
> On 10/19/26 2:22 PM, Konrad Dybcio wrote:
>> ALC essentially translates into "prevent DDR from sleeping to reduce
>> latency", I don't know what a good framework for that func would be,
>> but interconnect (even though it has the plumbing for BCMs) doesn't
>> seem like it.
> 
> Thanks, that explains why the vote is so expensive in suspend.
> 
> I don't really want to add a consumer API for that.
> I only want to get rid of the vote the bootloader leaves behind.

For a start, let's do something like:

diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
index 0880a287b0c0..f9d51f3d586d 100644
--- a/drivers/interconnect/qcom/bcm-voter.c
+++ b/drivers/interconnect/qcom/bcm-voter.c
@@ -390,6 +390,46 @@ int qcom_icc_bcm_voter_commit(struct bcm_voter *voter)
 }
 EXPORT_SYMBOL_GPL(qcom_icc_bcm_voter_commit);
 
+/*
+ * ALC is not modeled by any icc node, but the bootloader may leave it voted,
+ * which prevents the SoC from reaching CX collapse and AOSS shutdown.
+ */
+static void bcm_voter_clear_alc(struct bcm_voter *voter)
+{
+       struct tcs_cmd cmd;
+       u32 addr;
+       int ret;
+
+       addr = cmd_db_read_addr("ALC");
+       if (!addr)
+               return;
+
+       tcs_cmd_gen(&cmd, 12, 0, addr, true,
+                   voter->tcs_wait & BIT(QCOM_ICC_BUCKET_AMC));
+
+       ret = rpmh_write(voter->dev, RPMH_ACTIVE_ONLY_STATE, &cmd, 1);
+       if (ret) {
+               dev_err(voter->dev, "Error sending ALC AMC RPMH request (%d)\n", ret);
+               return;
+       }
+
+       tcs_cmd_gen(&cmd, 0, 0, addr, true,
+                   voter->tcs_wait & BIT(QCOM_ICC_BUCKET_WAKE));
+
+       ret = rpmh_write(voter->dev, RPMH_WAKE_ONLY_STATE, &cmd, 1);
+       if (ret) {
+               dev_err(voter->dev, "Error sending ALC WAKE RPMH request (%d)\n", ret);
+               return;
+       }
+
+       tcs_cmd_gen(&cmd, 0, 0, addr, true,
+                   voter->tcs_wait & BIT(QCOM_ICC_BUCKET_SLEEP));
+
+       ret = rpmh_write(voter->dev, RPMH_SLEEP_STATE, &cmd, 1);
+       if (ret)
+               dev_err(voter->dev, "Error sending ALC SLEEP RPMH request (%d)\n", ret);
+}
+
 static int qcom_icc_bcm_voter_probe(struct platform_device *pdev)
 {
        struct device_node *np = pdev->dev.of_node;
@@ -409,6 +449,8 @@ static int qcom_icc_bcm_voter_probe(struct platform_device *pdev)
        INIT_LIST_HEAD(&voter->commit_list);
        INIT_LIST_HEAD(&voter->ws_list);
 
+       bcm_voter_clear_alc(voter);
+
        mutex_lock(&bcm_voter_lock);
        list_add_tail(&voter->voter_node, &bcm_voters);
        mutex_unlock(&bcm_voter_lock);

Konrad
