Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC2E282F2A
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895756; cv=none; b=X+u9ghTUGV6AP3WUe12maUOsrovWXvg1zE1o94XgotQqqyMVuFC6Ukx05gYqF8lZVqNIZMoGV95glbx5KtZOJ6TNwC8PAUA4tncrb6+cSMY0Nr8wWYSDXJgto9s+Tl0rlrqVHHTzdNFpgSqjDEAAsQ1O+Ta1yKTmaEKG+nRh6M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895756; c=relaxed/simple;
	bh=Y2nhOCq3e5obtIKrWFEWNJ3Z3gLydgJkCSXS6s/8lrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nj24BRTppuv6k8XM2UkrsvWfHSBzwI0AJFP7CYh/+9t1Oj8PEeCeTQVf1mqpHn9iaexBCzzWzeDEb5BopSAO/TVaE3XbcMeOM3e2fbi4KbTiAOG2u+2LPdei02VE9dJqQRgrEGjOIt7YeKpVrvRKCHRmRC/OQ/9MxcnuOJBW5gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9SWrRSf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1JDDEB1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9SWrRSf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1JDDEB1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8A2fa302898
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQRECZeTA80E3xQl4tU300FfuX5snDvBVupZiuxncKQ=; b=j9SWrRSfeCHX1JMO
	Z0ondfYsY+pNvVh1XN4AXYK60rGASjVkCkI2Y5/vDCgYzp2CF5HTRHbGy6ypINKP
	OSD28RaH8KtrutYeLdNlRmRzngfCH4FMBS09OSm4ZQFmBLAaCgMoL5qT3p9/F59S
	U1JElEXcRbTMDsm1e0jpNMjKN2pnDYuLVUXm0sjzuouA9l6xfULu71x8p/ltx7DL
	7pG6u2RpeRs38gJTCiOx2/2lgVyHqdyGVec7jkiDqctPrjuPu7nCqoD9iCb9kFdb
	ebtE5mMe1I3xCJV87plIz1m6aKAsQHXKkbjXFTcWj5Tck23idbOEVjvwQurg9v5+
	gMYdzA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sqaxje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:49:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5350d8a2368so6525771cf.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791895752; x=1792500552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQRECZeTA80E3xQl4tU300FfuX5snDvBVupZiuxncKQ=;
        b=I1JDDEB1CwnwJ3buu+nnYRcj6ju5awhIz1CXgSOMtRHFSAWU84PKOkN0H3RPoz4R7G
         ivC8Jia27emxZkS3SaT7QIqn3q7kjzZfr5w4n83Q/Vk0tSoHzuptEQM2n04i7lofImOq
         lOtqk0maZKzvu7g5YZDd8ZZpDna5zG7+2FnxxM0iruxOOp9/KbrB5YuKVM8se+n/7VAz
         YVKxnObXbOJfpbr7jtHvcw6RQAWBjhTLNMeLeYixKpmB9h8Tp+w8ciOp3+VEVhfQAlD7
         ejPBWCNc9uxJUxWlkrgta7i+M73PwOtf8ucw7xe+bt993CTBtrdviY05w+Xf1My8L9dy
         j80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895752; x=1792500552;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQRECZeTA80E3xQl4tU300FfuX5snDvBVupZiuxncKQ=;
        b=aCJoGpt0ubMnje5en7GQw4pz6FYUeyqTdP3Jlq2VH/wghi8ymTJF/Lv7U3wf5EsGgK
         yQAmkvwpvdzaGlgaa5OhRvK8+5wTNYgBqK6zj7GbXORp08Kwsb7JCE87blZMxd5zRHmv
         n3hqrCH6VNqpFqAja9XiZCAt+3xowxd+4ItmwGoqhVblROEeVf4vRB99BU4STg8g6NUb
         UZ5XsSc87rvbRqeQUyh5z3GOwXmrUWfJxAkTIpuhBZSCFRmtPIX8IdGkAAyD2dsEEfb6
         plXV7ymrXt9GgsJ9APE4AGpw6yFNqWhQXbhSSO3QYOt2YlcaSzX27ldlxzKYi2tmwdcv
         CtmQ==
X-Forwarded-Encrypted: i=1; AKwUvByUsqu+92yvYYqSKNWVgDVeW5U5AO92dNpE+r+5LaUErxqst4pwflk5l+TiM6BraY/MdMOKq4FK+fia@vger.kernel.org
X-Gm-Message-State: AFq9FYJPVs1vdBe/Vm+Bkzw5jtM8nQglBIucDGODbNgL6eLf6MzksOGh
	0L6XmwJA5QuxKXIkp0k6+PPdBDZ/wCNziWugP6EatLN+gsnZ0RrmBuZZkJkZ4jqpDbxU9x6hbrw
	RpJ8j1QLvI1X/bcn+MKemxBEAOGUC7FW/tor8JmfL/M7RFtG3zprJ8QJyBHeswEuC
X-Gm-Gg: AYBFou1axg0/TjJ+Gkg7cdKamg/BQMjdEYj6DPLPcR8GDZWBUAEJ7SRqK5mahnmhLNi
	GWlPTHQTdpYtSzHZYzt6p9kAa801RstND7i73NCY1i/wbK7KugbGcohsBc8wauhK1b3fEsn8M05
	g8OyERsrhksLClLjRrpptPZ+EGSZYUE1P9X3xQtK0cxrjEvvydcIm0mQEUEDGNjIIele3ihMUgC
	PFoXmfR/WMgbm2MJqX0WY+HldpHe8UQ+iSebTYA0xh7Hl2VZhu5sFVRUfORn8pyABUKFAAvKpr+
	eDJbCQuP034+WygbjWlPurdWfIUX092UU5+qPN5ulH4tPlgU35u/iGvc+lfSV60JRSIRjKDrIOm
	XQc222c2ce5gDId9HMYKInA==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2434231685a.2.1791895751587;
        Tue, 13 Oct 2026 05:49:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2434219585a.2.1791895749845;
        Tue, 13 Oct 2026 05:49:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34722912a8sm272313266b.34.2026.10.13.05.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 05:49:08 -0700 (PDT)
Message-ID: <f34b2632-840c-4761-bc35-deed96b9405f@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:49:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes for
 APSS debug block
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX4qYjOFxkODem
 n8OrwP9xkIxOrHOhs9c0dH2y1JPv0/AgYHZjFFOnkVjHH/fVNulo9wLUriln8FbnNjGYjVEv5Ax
 Cm6e9fXUuLmdIrrdT3yANzVp/VulDWrfPdKGnfJ2h9krJICgsp3gBi2y4XxaXGTfvZhOZPouQLu
 RCdkoAxYkAXTEZz4LJttalcxOlMzBdTBL8hhE9VoyKKpBC9RdK5SGtvD/dxX70R4rSzjv8vWiKa
 Atk6tgyZ83UaIR4qlZ5WNH3ZHF6nPWsXFC/uwLoUUSShGo5FssCnW08hgAAzCjzhvQ1E8lujEej
 hHHoun4OQZaDbHyCsC3mMrznuSbyfx5xCsS9qdQBhIjJrNVRZiuAoJE/M7Oizfo5XFG7XaBE0/U
 am+6TwRmuUbo5NiAM05jnGFWVrFk3dw56edH8MPg8d/Amn4e836qymhLJgOWN2ApuC+oxA5yDw8
 6Ycz4kpgfa1fXaJG3PQ==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6ace28c9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=uzhSaxHqr0uYvXhH--oA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfXw2DHbN8ilqJj
 pT6tbKJIZEeMIbxVB37Km5ZIQu+fCyOV+0L7xoC8DNShsxj5/kQqAoA1yhNy9ctf9/0zpYgIX3k
 qQlLGBPE5QKH6YUaHYOYb9Z2fSBfeig=
X-Proofpoint-ORIG-GUID: kL218Ajuekte83KD4i47kTJ9SFaHnpQw
X-Proofpoint-GUID: kL218Ajuekte83KD4i47kTJ9SFaHnpQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130050

On 9/22/26 12:35 PM, Jie Gan wrote:
> The APSS debug block is built with CoreSight devices like ETE,
> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
> ETM trace.
> 
> The replicator, funnel and TMC ETF nodes in this block are physically
> powered by the CPU cluster power rail rather than by a dedicated always-on
> rail. Add a power-domains property referencing the cluster_pd domain to
> each of these nodes, so their power state is tied to the CPU cluster
> domain and the runtime PM core can power the domain on before the
> devices are accessed and let it be powered off otherwise.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 567 ++++++++++++++++++++++++++++++++
>  1 file changed, 567 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 131fd2a16c54..d9313de53ee5 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -218,6 +218,110 @@ domain_ss3: domain-sleep-0 {
>  		};
>  	};
>  
> +	ete-0 {
> +		compatible = "arm,embedded-trace-extension";

No power-domains for these too?

[...]

> +		tmc@1d029000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x1d029000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			power-domains = <&cluster_pd>;

Is there only being a single cluster_pd a mistake on kaanapali?

The CPUs have a different Aff1 value in the MPIDR register, so one
would think there's 2 (also according to the cpu-map)

Konrad
