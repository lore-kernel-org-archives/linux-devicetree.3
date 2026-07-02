Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4395347D941
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995338; cv=none; b=dfdabMd1XaLzeBifs4ZLt2m1ta/M2nHFqmAO1jqEazJi1deD5EhPusMoP3iqxQ7w7JgUMLxyL5K0L8jYTJwqH6ofAYh4OepEav2+8hlVQg5wn/hoxy8M/AmPVmoHSdO+ijUKVYvzY4jAtELg9rHgqBFBGp4jy0O/nTphdZO3MFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995338; c=relaxed/simple;
	bh=COpY2GemQ1U4F2t1+ZTX6uWDx5gWhzTebof26LsUZNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3nXWhvICQCvLEvAVzAoXIyZ9/vsY+9qAzjp17vnVS3D3/C9AhklN0Hh6yEC1u8uK+CZHXMQPZD7qZ+7Cmzjg8fbMjFi1ysZUZo8KknpiaeeHp/pDdDneud2WK/D3yQ8H+I7qV76Rx0wGginfzvu+xzcgXbXvNAb2UBSpY8yEEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b29vioLh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgeSkc7T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b29vioLh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgeSkc7T"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AZGap3594415
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 12:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lvzb1qRCN0AnTm1wAxas51Hw
	vQwvP/t+tsyHqLNwmlI=; b=b29vioLhQJzREsMmeMkeRegBpy2YSR+BVPJgoGCP
	5PXqVDzRk+o//jDdI0mq9EeJj93XR2jmBvSbFGjNsvYLqW0odFT6mOXsCF5A7Hx5
	+l2Cw0clbSg52UpVCgvLWtoFPBmVER5MsW7JJWH0CZ60BHu2XZYI+aV9OSMhAdUg
	zpeXAU4CLeKOoJ22IOKT3Ho7uRrLGniZ4VQWsEQLpeq2M9t5otNLWzQZUVCwZLOd
	d3E5gAzykzTVxb5eaNnKP0OW2iMD1n+vct0FEA4K/dY2mgYVAUz+f9gAq1HNYZwB
	1CwKNuSk0EfVTpQQnI5zIxmAQ94JUMElvTme9tKuCUXk4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9pm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:28:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so71734585a.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782995335; x=1783600135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lvzb1qRCN0AnTm1wAxas51HwvQwvP/t+tsyHqLNwmlI=;
        b=XgeSkc7To9D5pBgQgUbnEn8JMn4l4AKiHSGl+dWrggGu54LOIhqKA4Xg/Jxu8ra9QR
         0gH1CBdu9x+5015pJQ8HjUl+AGlCi/RY+CvNUIdYt3Lzri2BmBMSB7TGRqC1L5QF5q1V
         ymOPUJ0q6yvTTgJ+8jDu4LkEjMJFj++AE+Al3DeiPW2fhEMMqau8cZMrPvb0UbHcCTvP
         SUSXeP+7EjN+Y818nPMndWDPG0dXwqC8KYRVNZTO6AsKUlpfIpuynxMvHPY90rJ75uVn
         bbiQrVpXotTZCyRbMxFmjCJwX5pP+wgqtrAmSO98DfP9dx1J6zP0AIlwM2Onko+gHCN4
         w2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995335; x=1783600135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lvzb1qRCN0AnTm1wAxas51HwvQwvP/t+tsyHqLNwmlI=;
        b=tZy5Y2EmVDSOp3m24dmzPwXC8OLKCIL+Z4igWp5/I6EvxnEm/bVMloxcKH2vrxXWF3
         ON/x/nMYE4rrb1UKmpLZoy67gJgT/Yar2GkdZkwyQiLxw8n8Mg/tXU1iTIGWG1MJFegj
         Ou+yzjdzkSPvkG0TN9dUMH7FDxvenbAnzlxiy7NBUsQ/QNmHgRobJhDdS3+cbR60Jv3g
         cwpbw9tbj6kLPOqqbS/w0bxT2CMyMYluKuXavOek92uqlcx/wVoUSma7FZA2A39UCEKF
         085DJWttJ+VpfmyuTKqr71v54ulyETZprKllehcqhzOu8ocSiP3LggJQ4ZwvQLXfmmeW
         ZmzA==
X-Forwarded-Encrypted: i=1; AFNElJ9FqiA8DvxLXIevshhEIg8yR/1W13R0EKsXqfpYn9ARr22S8jxlPbQNuSJfr6s8EKTUIW2NsALp+8s4@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfi4ycRC5z9IvuIF5pJPOVMZq6HpzguLkxd8Yb2nNrpJlU6qOQ
	YpNZrLkel/uX8XRe7ddPsRDs1FelJortRQD/tLuBUfJRy7Q9Dbv+9CnsC7DrM+TkWYIqnzBULZJ
	ZnwGL6dO2s7W5/x6+d85z/pwgFVO2SY3OtfgAa2JB2WmZBr9TBH4b4Ezi8uYAaiXj
X-Gm-Gg: AfdE7cl6L5L1noD5arhybMe0Zlfs3020XbHPnl98o37/Uxbsca3Yqryq9m+iBkCGzHA
	XdchtBBEK7lUzJfS9jqZ59S9jmfVR7AphnjG/dxAEfdpy+nVu9kSZWBzgHBFSq9Dg63k6GzfJ27
	gKeDUumq5avhZcuAueEB5PqVAOkA0aSrg2r1D0i+jo+hPCbseCUO/Tnu4H0ZfxWRd66V/T+cpAb
	q5eeuAmrnm5CJ6eo6rWXdGFW10Z3gaA493FLnUEHeVjrje3/7eRpjitdYgiFJro8/kdWaEnKYUF
	wIjpsjCbdNK3mq3SK9si0y0jpHUQhMCC/CMitPwwrrRMIwcIEyqVTKa77W+/5STDOr0388sx70g
	gwfuxAm5IKkkb+hVr2sAtk1mIViDq4MdoG9uu8vKrd1orkMDWALbVJXlkmI+2y8aj1lyI6s9gS/
	U5CzL8vR08yacFUV3viOtr9LgI
X-Received: by 2002:a05:620a:404b:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-92e697c2f1bmr1298378185a.21.1782995335448;
        Thu, 02 Jul 2026 05:28:55 -0700 (PDT)
X-Received: by 2002:a05:620a:404b:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-92e697c2f1bmr1298374485a.21.1782995334929;
        Thu, 02 Jul 2026 05:28:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89d5406sm655725e87.51.2026.07.02.05.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:28:53 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:28:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, rahul.samana@oss.qualcomm.com,
        harshitha.reddy@oss.qualcomm.com, dishank.garg@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add QCC2072 Bluetooth M.2 overlay
Message-ID: <rgmbpm6we7o3ojyf5nlh6vq4artsbbcq3c26zpihlz3yxsm2ny@wrzagqnglyd4>
References: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMSBTYWx0ZWRfX6akXXpXpZWiB
 XO0135lpMQq4cx3QvwYojVUeJx7KsdDDLWZ9pS6mdNe1MUQZ7v2eCHDxQc00pTu9bG/PzJT/LZg
 biosSUg8Bd5Hd5F7bzL72Jv96cdwHS3r2/JaGIG6pZLZLdvUMiLDyK1BKzp31a5tTtc13y92ykN
 HIV9B7RZcqp4tTfibt2VxObQO9vHEsQNKl5NNS27+ZHI5cOWJZGV2JTBkIG4aIRaa0k7SeQ6dHF
 zZByerIjKX2scI0DHwe8N43b86DzGRS6x+zcq47fjA6SZSk7qEUIThhulz5fMS8SmU8UCgqX3Eu
 D4ZzN3sbcCC6oU6EOPRCQDIumjVkPtto8kY3MmzgipZztFKW8WVMP/IqpR1rfmMejlilFH1Px7Y
 lZ9GNfWNFt6DeQwHSIhV55+otc8z5Nvac8lE70MOJW482g+29A/jj32xxOzfpM6DLzgzXb7YsB6
 Y+0damhF/6bdf3M6kFQ==
X-Proofpoint-ORIG-GUID: 4yK6yc_GyjYxhmGXWpp0-EkPcyZcTM-c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMSBTYWx0ZWRfX9qv6SE+ozYgQ
 oX2M6XByAldE9YWzgQ+4JDKT8Dco1ja2nkB9CHxAiBJEiP4Dc1+oW0rrc+YhpYKQBZKq7aTqsC6
 j46O7Sw8m7LEwaSYOShgUznRx+HqZjc=
X-Proofpoint-GUID: 4yK6yc_GyjYxhmGXWpp0-EkPcyZcTM-c
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a465988 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-bbeSf0u8fdg_r4b2XgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020131

On Fri, May 29, 2026 at 11:32:34PM +0530, Yepuri Siddu wrote:
> Add a DTSO overlay for the M.2 E-key slot on the QCS6490 RB3 Gen2
> industrial mezzanine board when populated with a QCC2072 Bluetooth
> module.
> 
> The overlay configures UART4 (gpio16-19) for Bluetooth communication
> at up to 3.2 Mbps. Sleep pin states are defined for all four UART
> lines to minimize power consumption when Bluetooth is inactive. Host
> wakeup is handled via a GPIO interrupt on the RX line (gpio19), and
> SW_CTRL is mapped to gpio86 for power sequencing.
> 
> Disable UART7 in the base industrial mezzanine overlay as it is
> not used when the M.2 slot is populated.
> 
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  ...3gen2-industrial-mezzanine-m2-cologne.dtso | 110 ++++++++++++++++++
>  .../qcs6490-rb3gen2-industrial-mezzanine.dtso |   4 +
>  3 files changed, 116 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-m2-cologne.dtso
> 
> +&uart4 {
> +	status = "okay";

Status should be the last, empty line before it.

> +	/delete-property/ interrupts;
> +	interrupts-extended = <&intc GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>,
> +				<&tlmm 19 IRQ_TYPE_EDGE_FALLING>;

Align on '<'

> +	pinctrl-names = "default", "sleep";
> +	pinctrl-1 = <&qup_uart4_sleep_cts>, <&qup_uart4_sleep_rts>,
> +			<&qup_uart4_sleep_tx>, <&qup_uart4_sleep_rx>;

The same.

> +
> +	bluetooth: bluetooth {
> +		compatible = "qcom,qcc2072-bt";

If it is M.2 slot, then it can have any BT card, not necessarily
QCC2072.

> +		max-speed = <3200000>;
> +	};
> +};

-- 
With best wishes
Dmitry
