Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679060;
	b=2G9JEtx5Bs1u7+Z1AHqgKu/m6bldyPJDWpqiUiJ9nSvOglBQgxWPNxEQLowskqGTK5B0
	 lWfvKWiWZ8b9lK5cTW13S5STo1bcW0g77zuBlvWB2GKOiwj04UR2GZfQ8yBXs2valTfsW
	 f09RB23hguOZWGA7XPWFTQGBdcCCDtvbh2sMJu+mMbtE0faGkIsV/EJwraAK819QN+akf
	 2ZuwgSfeuRiagTNioU8gjB/dp0Bj2g/KnGaR3JqwMZznk2v+oigmQYJpdwCaGwWQOtLMe
	 3UcG4NbZSvvyi4Q5CBGb6kHAVhfqwKSUpFnnZqg6uOK/Izxk/PnkRXGspxpV6NCLdqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679060;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G7aKyVjdYavK2ZAELbW1cotgkHAtEELC6+iiVeRDFQ4=;
	b=mMcnpvwEozD0xQjezwer3sWBXisdXEO9QrBD0gzZw5aJZ+TRz8alNkovtyopqCgPynKZ
	 5FVYeKA4yL/PPs5EIlh0EGytO2UC+xZsdqyQHVEFpXtNE11L/JYdPTAsNhvREH1wYOpUu
	 IFJW+yvLuTGTE1EItmN4XV75Pe8fTikEYnbWFs9Mf+TvjWthbz2XiDZmBAJMECtxm3TCn
	 iftBfAoJgYiDQDzUprGwvgrePjnDEgStGGBdqZC1T4Rp1XM3UinrsFug3XpIlcgsD79QA
	 TbIVad9sH/I4UADTPGYrmAayUhxfq6+bcTrAH3JZ4kUnRak1NMvG/KH6jH3dOS/548w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2I91NFM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qpc+GDZN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4161F606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4161F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2I91NFM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qpc+GDZN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AweQ695016
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G7aKyVjdYavK2ZAELbW1cotg
	kHAtEELC6+iiVeRDFQ4=; b=D2I91NFMrsCgWpmcTIk+zto9ft+X0bo1UdjxwLH1
	86unbUWiUZ5NlhmZnvnO2pnnqWCwXjkU4pcsMw7ytJ6PoDmB5sUfY9b5WewhbZeV
	tJFU8Sa+fAVnp8gvjzUOcAR5g+fiOM7d+lDKMW4Af0LR28gVtthxVtjlLXw+1KeZ
	Qdl17zNAN8h0l7jqj/aSONnJ4k/j6lRwjqdfz0YF53AG8j21Yy9sYUalpwT3owCL
	/J24RdpPV2pgtPlPSeEGcRFWa5UVbQACVMYL1RL72zP6cAML0a19PP3+Mq/DRCi7
	7Q9ifxYYYtXqVDazBQjQe6RCzZPFT8HRDeKntrwpU5NkyQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7r5rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:44:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so6311851eec.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795679058; x=1796283858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G7aKyVjdYavK2ZAELbW1cotgkHAtEELC6+iiVeRDFQ4=;
        b=Qpc+GDZNgG4nRVPTRMYQCDfZM3xgo0w9Z6KMAR5DlWA0unDniM/GuHb/CyhhljVfht
         0W/zWPmtJN15c/wi24UCmV1/uzz9VAIF/rOnNmsaZBoWBxHQaglSsWm01ieR53xh9P90
         47CRBdfb0dcerxCV5Mtc0IKTOTK9ecxVUCJTolUw6q036RqloBdf+3cj7lGmAEBYkIjt
         S4aVzTUHBJChXvDE9sLshZoi2XWhWg1xbz3zW6+rIlrnyLGeCrL+o+sUvJy5f8U89uwf
         0KXVCSgQsjirOFpTspa5ZtfsFRH8psZcPy5+PV3VMs8eWbZsyPfcMh9NuxTp+JAc73z/
         gRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679058; x=1796283858;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7aKyVjdYavK2ZAELbW1cotgkHAtEELC6+iiVeRDFQ4=;
        b=OAfEZcmJYj5u3o89hBF1B9gVg/Gv3jkbo20G4a2RVe7EYZcae3WfFlsbYIHyPAmmAa
         Ag0td4gMIP8V7vrZlpFA4rS4GKa3lqMpIDGK6jvq0xqUmuHxl6UKRgEF9I6vE1SFoaOK
         XuvjTlP7DnaM4Bwt+p8gguvj2A2mdPynr8BpZA3IAXBqFQHn5CnDA3AJoUwIxyCtWKg2
         n4G7iJRJqKdZkhf77L+I6QPP0SxVhmx9XvQhK8VfR7rZCE413N7PWKJkqtZT+MAX22Yz
         2Is5rPGfhma0bFZR3pSgPgr6Xdc/hs/U9+Jc2EEj2653ozMCM+7Za2PKkxnt1EhsMGWf
         iNvg==
X-Forwarded-Encrypted: i=1; AL+hErEH9lZd8sNRcc83jqz7inZLiOP72zygL65T2+Kw8/imyw0MXYC39Ija/M0f20akfTQcbcnDL1+r0IG2@vger.kernel.org
X-Gm-Message-State: APuU4Z+lJXp45up35u478lAm2xLDVWM3O481W0ssh/2DIZUVReqA1VgZ
	OeQkPeb9kEJ7cGaIxghek25Ioz76o/PxoKF3h04KC90QiAWDKFfx1gEFMaXFg2NeTckGqPf+haG
	0hBy+Iu66d5cu1e9ofGrnb/Am/hdVd9MDn5TjkZEDw9FI68/WL8nrDNKd05P26dPI
X-Gm-Gg: AZFdTZcMEFDf9vw45fG3jlyifdtzWvIJ87a/E0fzcIB3Sz4mdzutRLgxHdYlKpPdrag
	u1GSOEVYjJpBYDSV9UWS7q8fBKrmnAckWRMZFYuQ4jpQSER8SatFzaD6zFdsCxfXbmb+B5RjuQf
	8HHHxrP2EPb1AuuXi4wb4lG/Du3edUD++IvJAglkPO8Mlhe9GHHq7dDkTom1SFoPABGpumNSmg9
	XE9RvYIYX1iJDhvmOACCUZUuoGDAUW1F+GUw27sSRmGTMVR7zOZL6hVMcoduuodCIL/2CuNkZwG
	amO4t7zyP0aegZc2eQacycCJAItQn6gy2ZkNr3UyRdAdkqDMjLobYdRSeA/AUrgXM0N4f9JnygQ
	aKcWL2kJALFN6yRbS15qJ0gDG6B9xibPkHYH7gunDF0jfhFEXBXNINgFOtcBPxPT+gkVgmY0FJu
	k9XQwJgOiH5UlqwpYJHS93DV8=
X-Received: by 2002:a05:7300:cf87:b0:386:565b:4f9b with SMTP id 5a478bee46e88-386565b529dmr16390653eec.36.1795679057778;
        Wed, 25 Nov 2026 23:44:17 -0800 (PST)
X-Received: by 2002:a05:7300:cf87:b0:386:565b:4f9b with SMTP id 5a478bee46e88-386565b529dmr16390634eec.36.1795679057224;
        Wed, 25 Nov 2026 23:44:17 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm64100626eec.14.2026.11.25.23.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:44:16 -0800 (PST)
Date: Wed, 25 Nov 2026 23:44:15 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v5 02/11] usb: dwc3: qcom: Disarm wakeup IRQs on system
 suspend without wakeup
Message-ID: <awfjT6DQ0beqlLUn@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-3-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123104727.1539149-3-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX495mcELSPlqq
 4ir2I+GEZl6V8pAESC7KcGx0bYnbj0iephdKRU49p9yFBSH2NO1V3quk9M10KF88vHHm7/lnOjf
 M9AFDIEw0PbqL2zz/glmJuhqqG4cDjg=
X-Proofpoint-GUID: d82DEEJmdKWmI3puWmxFHmYTBCDe6ecI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX9Er61kgM05fF
 7gJvPndaUAx8Oa2WT8/FD1uBX1P5z8BJ8VvJNtIKHIUckw5b2jLR5a+b/TRAaU6TWiV5Z2rEJ6L
 +1VoNoy7j/wA7ftJ4h8YBOHVaq9cummyboQyv2+/ECt7EPxf/eum8vIHTlwaTJRL2hVDG+zql4v
 dB1FWszY2JH9f4zLf3Enm9Wt7f8LnLla2rotlwRVHkUwpZ1Q8ku5vQgCKm4aHxXWovWDndF7e0W
 i7hgHvw32UgYdRVP2DvUHEouJ0rQyL9hW3r+DkkRSvDcZ+1Z0JFcTbm+mqqGqyeWJ1kF4yj9mWZ
 T6ynEmoQ3m2bFQm7hcCS9acmYIdzuvocNTS1uIHSuD3Zq7vJcDfdfDqS/cY+1YuZKfBMrWGYh8v
 iDrKIg8SH3IcmiM+84LJFHrvpDiKGkL2i6bcPGutyYERzZc0Gr1JbMDmgYuP5LJ2oWmjbI5UfiB
 KvCPoQnXIgSxheUJfYQ==
X-Proofpoint-ORIG-GUID: d82DEEJmdKWmI3puWmxFHmYTBCDe6ecI
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b07e352 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=BlGo1tluQEYad71Xd-AA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260029

On 26-11-23 16:17:17, Faisal Hassan wrote:
> Runtime suspend always arms the wakeup interrupts in host mode, even if
> the device is not wakeup capable. If the controller is still runtime
> suspended when system suspend runs without wakeup enabled, the
> interrupts stay armed as wakeup sources, so they can still wake the
> system. System resume does not disarm them either, as it only does so
> when wakeup is enabled, so they remain armed after resume and the next
> runtime suspend arms them a second time.
> 
> Disarm them in system suspend when the controller is already runtime
> suspended and wakeup is not enabled, so the state matches what a system
> suspend without a preceding runtime suspend would have left.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 7a7225b900b3..18db19cf2065 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -350,8 +350,16 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>  	u32 val;
>  	int i, ret;
>  
> -	if (qcom->is_suspended)
> +	if (qcom->is_suspended) {
> +		/*
> +		 * Runtime suspend arms the wakeup interrupts in host mode
> +		 * regardless of the device wakeup setting. If system suspend
> +		 * runs without wakeup, disarm them here, as resume will not.
> +		 */
> +		if (dwc3_qcom_is_host(qcom) && !wakeup)
> +			dwc3_qcom_disable_interrupts(qcom);
>  		return 0;
> +	}
>  
>  	for (i = 0; i < qcom->num_ports; i++) {
>  		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
