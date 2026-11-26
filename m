Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714328;
	b=Pu9LoxF0gSYU30uskMg0J+j+YUOfP86ceRNrwPr1y5pc/uhaxHkT2iU6xFCWvsHrurJN
	 Q39E30MVks14N1WRTJA+HU3iQmp7sC8NqtrlkVrL3PecyF2mVdIPokZFAShkhrEihMzC8
	 DEDK9JIUUXndOlACm/yEcaSKmeLPWlB+Yc3VI4ptnYsZ/0J1C8vnWhec4AxRMcfb9qYLV
	 /oNF/0yKb/OuKlhi2WmenQVm+UKFRjdktoeuAsVKJNHaERV+QtRDvMTBlum/h5piY/NK8
	 RPI9zDi6KMMz8qnZRHR0cmM4vftJ3c8FQfN/PPde9Ti7TFcmjLZF61WHnRMqDPR6C/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714328;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=;
	b=L4iR74tPMS60hFh6CQaNnRRyC1y7CBnbjE172Porwb0Q/xFhTtU1+oMEIckIWaaC9a5u
	 EDo2XFK5p+bpJuVcnBDqpILn3K1C5vDxY0lk8Ak/a7PeDAP/qW/KyScyIzRi4u/YB+bTp
	 JiUEa7J605/pCZtjmpfyx0qdnKz9GBhhppOzBjkRsbCyrvISqJsz/uBDUFrbDPc1jrIVE
	 i5JQ40UJpLGLXiza294WBCX8CQhUTmPq5dWlLI9+Aw/Q6u+3IBLhYZBIBwB4/UPaQFUVS
	 vmuJcLD4PWJ8RxrhWcHVcVq+n2Ruuz/7Je1BOe1I8lalEy4DOlUQLuwl7VlJSMrClqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHGHk5DX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nje3F+ca;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE7E606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 17:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE7E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHGHk5DX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nje3F+ca
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuNKx3750286
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 17:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=; b=aHGHk5DXdGm+xSDp
	t9TtYweyTDwg7nx+aw8ZFt/A4TBw9qeDCgg+Rk1EhOv9JC7WmZcHw3uq7TzB8mJ1
	ySLjoKw0s8ibVxnjV0bumOY700ksROzumX2dHR3cpsSUiE4Ch8cdI6f7JoI235XT
	b+5UtH+1SX2LIgkSMAp0tSDr+R7ZoxwuqArXrfd5gse8yfQX7bSHGuTSPHQzzw+F
	yW+Klx6DzA/g8vB5ubtG4OAtK/1cL56WROPjCuRzMYk7eEnyViM4Pzp48ro7efxr
	E+T4MT7EK8lLFLnCKG8yp45V4/2ZLyXupCkWuRhPo62UdBiTwY/DU/h2elj6x2BP
	f5SPqA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sc5w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 17:32:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b8cef34b43so7432110b3a.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795714327; x=1796319127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=;
        b=Nje3F+cacqnvCTzctixs8NCEWVijYbfMviH/izKO/RFLP/w6t0jppyy1IkPx5V+W2Q
         BGI8lI4L5Me/gxuewA2OxJI7Ey1w4OLOFlPqnagnPRjy2zXZa7Z+2omKkc+dGLO+HAiI
         GW1heMbKXC6X8lNSw92j05BAn9/yHuUEeFs+zwLujtuWCWleiiOkMHP0HicKSKWtB9lc
         8Rcd8foAhed1jYwThxYGRd3xRHsuHHmYZhq1a4WoroyPXWKbqE0YHQdjaLs+sciXz9qM
         EVCDReeT3EiuIMVUT0o4lxbjfvbEGETXt2q7x+Xf4Xbv/O//NeOxPPpvYdzy90Nt2Usj
         dk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714327; x=1796319127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=;
        b=OwdHbVYy4CaC8t2gXt3DQ8pk3Dn9BaZiOD8pbvbGAWDZp4dKLekqNzbTd3OGJjw6yL
         jXfF15g+dvqNiIGVZGAVcOhLkvFaZfE6wn8z0AipkBMO4LWCXxd/X8T5hOLXcK/Cv/zc
         kQrBa+ljDff3dhfUAYk0Y4zJ6XnZxfu2TNWfW/bxyXNuGhTZ/lVeWqfqXW6qQiHIa/hS
         leECJoI98tVDpj4UOLTcOMdaf8AGPAPkQt8/2euYwa/D7PF5R/kaJLLoPDMC0QgYDnPq
         eP8dVOH+mg5Emq4RJESDSMzQYPsWW4MXmO2m3iA3Id4FUyp1bxRBqG74NPUhWAP/dlbP
         KNrw==
X-Forwarded-Encrypted: i=1; AL+hErHHAy4qLUUb6kjthiFaxiBLuQhcT/kmU7fZGqXBvCcnth27VYJpUq/XNUaXbnMkrG0/Mf8Zp4gJjgXc@vger.kernel.org
X-Gm-Message-State: APuU4Z/10kZiMstG2mN0mFH1LHMJPZkIUZgWKrs1EwwEGuZBgakBjw01
	sjIw2jnxQgFvZwBEbRKpBAzs7xX20hHI+C6tWdZ8FOimEubaKLvj/Btac0AQwnY9/6esTZMRd5F
	ihx5CULC3Tp7P0BXp5XKBPiap9l1lkHQvAk7z1X+LUhkMmypa/EPLY4X+CjC+GSYn
X-Gm-Gg: AZFdTZcW7dPST0CE/agY9IcdvsHMIwY1MQdiabFcbMCYL593udgeRsXjf2oLpNXA7I+
	qxMvmge6AO/7gYxGjbCdAP19fKDoDc1Ja5bsifpDfAq9dMS4JtmYLBuAu1ZvijDLDZXPQQ6AcEc
	URqrnaOQnK14vhCAXdh5V7OKCqFzXzWex67bU/Fp7QClItokiPvgMQQ0NRPbx2JlHNisOcEaYv1
	eLFtln4iuFUfpgWznNi3s0xZBBEwAh7N8bOLr1JP0fZTOikyUJVtayaYBruWhvXapuUQ2DOBIjy
	8ZncOaXc5HLhBGF8o31bsU7GeeWh7vIZoG2KscU10ZbcgNCEf4VdoValVmQmi3DymAkz/ogS25v
	LYkYn+Os6tWaruaEJ/qUIpi5LLaYz5pipNO1LREOvGXI+uGM14d0vMJO0IKUF85WjCc+csw/kjD
	xEYU+moDn4uUKWDvW6QzF1fsfa2nKaTG/0BYzEG929
X-Received: by 2002:a05:6a21:9086:b0:3e2:313d:2da8 with SMTP id adf61e73a8af0-4014c752257mr24967833637.48.1795714326865;
        Thu, 26 Nov 2026 09:32:06 -0800 (PST)
X-Received: by 2002:a05:6a21:9086:b0:3e2:313d:2da8 with SMTP id adf61e73a8af0-4014c752257mr24967805637.48.1795714326388;
        Thu, 26 Nov 2026 09:32:06 -0800 (PST)
Received: from [192.168.1.8] ([122.177.242.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm7776293b3a.25.2026.11.26.09.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 09:32:05 -0800 (PST)
Message-ID: <3c1b3957-3ce6-4109-8465-246d87e408f9@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 23:01:59 +0530
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
Subject: Re: [PATCH v5 03/11] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        peter.chen@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b086d17 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=EbDk/eETi6Q6sYbTlnF7GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zjTcfuHnCzxvNZJ2CccA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: nwyotnsgaVDC0NHCcmPdowGv0SjSWkDJ
X-Proofpoint-ORIG-GUID: nwyotnsgaVDC0NHCcmPdowGv0SjSWkDJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfXwweUEebzzkYs
 53Gj+AMYjfNbjjE+5/yi0xLGK9BZrZFj4icvu6rFYuSA6iMDy1/zbgLCSIt4cP0/wKBQfF8u/vD
 osvd3ioFyUYu1UTcNSqVWlySxYzn2AKsOJ3SWBsgSBHk/DS6/Y9zFmkTQmEmAxa69Kh1+uq+gzC
 aYOIJ7/JlUele2YrOSdFYX5qzeQxwD0C1kzqiOkKKPgBFqCaPqJ1TQqLI3/kCcewVNyENtcbVy9
 DHbCQ23w3m4V1zGSSQrz9OPwLMnzRMEUoSewDWZrhbnAWecCqnvZ2jeauC24qOmsP7q65OAd0cZ
 1nmHdVm6TFBnSXQkseHuBq8UvQiuN8QWcAN1YhVPxtBEWMOGj9bqH9fWxa0+Ygw2ZB8UvfnP0EJ
 lLPKAgr83a3xgz4CwlA1kPw5+dHREUyONiU3rspgB/fc79YyrZ1qxbOIXabv1zsNwATi4n/9CcH
 vGPFhZeCM+QB+B1L5KQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX+7Yv2EZaWjR/
 q93fRG+09sXYdC8AVz7Hy13Ga9mTLKkWqe5fYYj/OamaWtJ4MEU+d0Si4QdCqZXZvH6W1J1PEHh
 vZNs0azyuoeCMtMx3OCIp+02C0GSjrg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260068



On 11/23/2026 4:17 PM, Faisal Hassan wrote:
> dwc3_qcom_resume() disables the wakeup interrupts before enabling the
> clocks. If clk_bulk_prepare_enable() fails, it returns with them
> disabled. The next suspend returns early on is_suspended without
> re-enabling them, and the next resume disables them again, so every
> failed resume leaves the disable depth one level deeper and host-mode
> wakeup is lost for good.
> 
> Re-enabling them on the error path is not safe either: the
> level-triggered ss_phy interrupt can stay asserted, and the handler
> can't make progress while the controller is not resumed, so it would
> fire continuously.
> 
> Track whether the wakeup interrupts are armed and make enabling and
> disabling them idempotent. A failed resume now leaves them disarmed and
> balanced, and the next suspend arms them again.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 18db19cf2065..e7fadad9a4e1 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -81,6 +81,7 @@ struct dwc3_qcom {
>   	enum usb_dr_mode	mode;
>   	bool			is_suspended;
>   	bool			pm_suspended;
> +	bool			wakeup_irqs_armed;
>   	struct icc_path		*icc_path_ddr;
>   	struct icc_path		*icc_path_apps;
>   
> @@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>   {
>   	int i;
>   
> +	if (!qcom->wakeup_irqs_armed)
> +		return;
> +
>   	for (i = 0; i < qcom->num_ports; i++)
>   		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = false;
>   }
>   
>   static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>   {
>   	int i;
>   
> +	if (qcom->wakeup_irqs_armed)
> +		return;
> +
>   	for (i = 0; i < qcom->num_ports; i++)
>   		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = true;
>   }
>   
>   /*
> @@ -396,6 +407,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>   	if (!qcom->is_suspended)
>   		return 0;
>   
> +	/*
> +	 * If a later step fails, the wakeup interrupts stay disarmed, as a
> +	 * level-triggered wakeup line could otherwise keep firing while the
> +	 * controller can't be resumed.
> +	 */
>   	if (dwc3_qcom_is_host(qcom) && wakeup)
>   		dwc3_qcom_disable_interrupts(qcom);
>   

