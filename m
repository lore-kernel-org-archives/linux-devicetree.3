Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4563EC83E
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561216; cv=none; b=CqrpgIewh/cx7RI1CMPwDGwwac1QUaClSwGFH6+m81UGTXxPjngZtwZsGgNC2OvWpMWKc8HljvDpN2LSzmn3GthYpIha5Z7G/1X5bPU7IzkI5spLFwp5HgFzSeKOazERvF8RlHJd8PfUZSWu9ooDVGWCKEbZSzH2JAOoUFD+2BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561216; c=relaxed/simple;
	bh=sX+wuwD+X+HIlWFprK9YR6qFkyX+Zt/RSmNQEjo/qt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSuZNAzVtCCAtZiKdlGmwm1nHQcLL4CP0bnaTHJ6M9meEC08q/90W/fwUtedw7FSjWn7JI5ks/nEkzYKlVyiosx2FwpI2y83Si+1tCuxaZ54jxvg3l2QsindD40VtkbRaddE5lD4Yz7PrthFFz4p+CpdfWKBzEenkHAjyDQz/Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPKL53zE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvThDcyu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPKL53zE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvThDcyu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5QxjG2041148
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sX+wuwD+X+HIlWFprK9YR6qFkyX+Zt/RSmNQEjo/qt0=; b=dPKL53zEuu5ZF8CQ
	5CCiIp3559gmOEziRf4UOGRZbtRpvIpoeIruOPCIMXg/heU4g89dncrAvOwJNu5E
	cB4ShB110c/23eAtBa81qTjxoL74p228Evhx7jsaFjIqQUuWzon+WZZvrKRrPaWT
	IkwmT2m8eSpXGpCh+DFA7mC/CP857vd2RozHJtOJbrg5ggM5HYaBnUOj8pzSwpeL
	VoWCeaSS4IJjnV0pqCcB1PIZmfByLLIXellQWslJXu0FPz4+jibEmfVtGNDIH7Yt
	WSc/mwvGqhgfRG/7vtJNM7Nf5yJANtGF3FiZhRSTeLHznmAUAytchz9mACH3ZVqK
	9zc6qQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7hqn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:46:50 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-77f133855b9so5169137.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561210; x=1788166010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sX+wuwD+X+HIlWFprK9YR6qFkyX+Zt/RSmNQEjo/qt0=;
        b=gvThDcyuZYewjKTFP0cM5qu0rEoz+pfAuBUuUJi3XhPGSOg0FNNn1VSPGZWzQD4sW9
         b5GDE0mImEPzeXi4gUXXrpw9QYN1LlSFcMP7JS3UfmxnjDhFOc40WZx0HdHrhUmzfbBA
         HxVQbhaU5UXENjzfatthC7trAG5QOJLOzfXIy4KLOF7STAq82/t/RAUbT5oAZdfnXJGY
         scA5Pr+L6vCjC0xwQZfXbB03EBh95GCjJMfLIHx4RmRAJrjdKkyOXuc9MJnBjZqngWgB
         WGrUCgP0h+janz2Wv/yp3V700E+pIWnDagE/mOUiKFtV83dUgiAnFxr260YiMiwRI2GW
         M/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561210; x=1788166010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sX+wuwD+X+HIlWFprK9YR6qFkyX+Zt/RSmNQEjo/qt0=;
        b=Rv1+8xf86reLVh66XH7wTfyVDF2VYNCAItqeEz+IbINorRUbb7MrZvgsBMLoInJ8dL
         aEa1IzRXo7VjrMdXDRSy43hF/yUQQrYpUttWp70SpivZ+Gls7PQgL3FtBEYnGCGFGMM8
         v3rwWevdSdDU8CvbZF435QED3ivJgMyhbPMtceU5fKqOs5vEk0o0490EjV3dYilw926n
         b7T2MlZuXBpY68odmhroyB/1Igpmj/raK5u5fxcwzEgjFxShxkfxHh5Yxdu5xgRhf0pr
         YFtvDzDAGtblWva1ZkDwTZOKccDwr3PJL8JWWg91vzGDfktkXD71bhWNsH8MqkOmMCvr
         ufhA==
X-Forwarded-Encrypted: i=1; AHgh+Rol/5DuyHkLGzBKr5BPyulm+R+zPbMqmINr2PNQMLcJ/JTbBqAZoWEpAQNNJLf4wsy7m48DP9RyS6sU@vger.kernel.org
X-Gm-Message-State: AFuF++nPVlZqSo1IuHRmlETt+7K875dm5EeSsTmlLTBuV1M8HGCBU/ns
	L+LNLf/CMFw7DDU5t4G3QAH3MenY4xlCNae3ICgsu2lpPxfxDeu1OucYtz1Zk+7ZCWalelzmah9
	jYMmpivGiiwoMhcNLoXnuTkNr09hxfUn1+EPFL0HnjQCeWh4LGZDdaK1VWTSo1Af+
X-Gm-Gg: AR+sD10TLDkmofUA4UHJsuEy97nYhB5GbNqfFC+44OSPw8WA49kGdkDJquiS2rDNJYf
	sPEvDJWXWxIAeIzJ4BpItE/8NPMhG2xFa9TOieBcQlxHOHarys05H2dN770p6fK4Fa0A/KwPH2X
	BnwuPOBGcL779YJFuH9yMz69n5VsYzh6fTs0YPLNrD4l/JL+Xj7it1cYGVclxm8ABodl5tOC2I6
	gE/HpNRwh4kiznM5DaBv6CaCCXnhmRa8+W3j7c+N+pJWI+V1Evi0N3hxc9RzZ5v/LGlwpPeto41
	b90NwMWQQQes3KGBkWuPlOldAuWglAQKVHdAY/oFZhBEtLVNF6u2+RbI+KpN3KyNJvZx9FeWjSy
	k1dXtDREN61BlfysctaP6hqEB
X-Received: by 2002:a05:6102:d8e:b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-77a5f8ee1f7mr3580135137.0.1787561210039;
        Mon, 24 Aug 2026 01:46:50 -0700 (PDT)
X-Received: by 2002:a05:6102:d8e:b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-77a5f8ee1f7mr3580128137.0.1787561209638;
        Mon, 24 Aug 2026 01:46:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2da49bsm8665454a12.29.2026.08.24.01.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:46:48 -0700 (PDT)
Message-ID: <578542bf-36a3-4cc6-91e5-fc5881c60432@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:46:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] pmdomain: qcom: rpmhpd: Add RMPh power domains
 for SM7250
To: Sreeshankar K <sreeshankar0910@gmail.com>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org,
        ulfh@kernel.org
Cc: bmasney@redhat.com, radu@rendec.net, abel.vesa@oss.qualcomm.com,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
 <20260821154030.2514-9-sreeshankar0910@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821154030.2514-9-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c04fb cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=0Fz9-S7UgyL-nH97HSEA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfXy8Exk6snwXMA
 cogG7zRfpMDH31RKXM4U7eXPUg/e4KW9kqRjLQEgRdQypagiySSW/uYFx+41P0VNRa/D0/sUQT2
 OmOZTsCOt1tJL1mU99vnfGu+h0gRV00=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfX02Wm+ZSJfWB9
 FH6PlR1ndTtNm56dKqPEbi+ZyI4khJo0CH6rR3O3lHP8MxT+77o+ACA16W9p5Eoe5nrFIuH+Jw3
 yw7sHgvGCVFdoq45xdBfd/AOSep+yor/+zm6QgGTA0taJm3F00eIgTdGSzPua35ISybpHf1/5vh
 OrtVe/MEg3fq2bfudyF7xD2+CCzlaD8WzZbKIT2r/tzA9EZFXx3mc7fY3KgE+/bYOrlESxm5HRT
 zH9MkuvESPXPcvGYZ3nd8Lu06hUpLg54YwUjXe8z9KI7Hw/DDeB7lTUMYewNFycLzyPAHPU0DuG
 LB7ivdJ+beQ8+dSrrIX0WmcaugapLxym1k5Peay6E/s7RcvMGYx4c4sFwfjZ7IkA6nQ1zZ02Cp/
 ZPbmFKORdymyfkcYFI6hNyJkPhNE1YDSX5lC+z/SEgGOeiRj/msdN9g1Z+7e9vTH2edUbETENSF
 JU+FPO/Qedg5YaBu+vQ==
X-Proofpoint-ORIG-GUID: oUXEUVek4g4W70Tl-AEZpxzF59NUQ6mA
X-Proofpoint-GUID: oUXEUVek4g4W70Tl-AEZpxzF59NUQ6mA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240077

On 8/21/26 5:40 PM, Sreeshankar K wrote:
> Add RMPh power domains for SM7250 SoC.

nit: typo here and in the subject

Konrad
