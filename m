Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451554;
	b=s3zuSN62Im0Gou4ztIPnIjTn8UJd2E0JdlDzRCGUB++3RuHYa2Vk2T1p4n1m+ar3QNeZ
	 kYJ9tWRbRb04hh5jwm6DbQPC8L/T/MZ9fTNbldnbFiGC0pjCMsN9UczhR2/WCrSimO8On
	 Cr7qdcx6NV9yihQFq9EDce2bU0g7cbRiUYOfT9yjpmIt+9DxYA6x+tvPWN5MgQeb/dSm0
	 X7c4+YvFyD1mKLkZjKmKR74qje9AkEtCUOW11OvgFWPeOIG6ITDef93hEE8S6JB0wgQRl
	 M5xVMgKV3V8Wr2s3UQV4WzgDDnJkkUtFywJ9ctBl3u/LI+Ko4UT4LbljwbJceCB3VUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451554;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0TGuUSV5XSvPI1Dd46vwu0GsnPiDPUv/PqFpk/6rYNU=;
	b=ByGz7EF0cKoMON4OQYviqFGAIoOTuBrRc2BigjLYvz6Mn7fTciY3+pw+z/7ynRmBFjS0
	 4yRr7Ci3S8EgEK82CWpb0V0l3+PA0c6ZUXeFfI+4pDv2gBcpXKIurUEYW6TPPcofolBOy
	 uNMZ3RxJIaOBqEtDHXWHyniuwVKBY11aRPlaMJORY7wBUcWOYxZpYQToeeeLDcgWv+fz0
	 2/3L7MidRKEBJbrxVbu1AKgGtpUY5i4nUww1e3is7xyurYY+CFUdUw47l+ttLcPKKDqf6
	 3HXstCbwyFoHdCIeeG46+nv4gEeKompePuxs1Akvw4T07puPpEoB6qeg1/vM5bSAz/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D3HkjXy3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QfpG2JD1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493FF606A339
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 493FF606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D3HkjXy3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QfpG2JD1
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGvlk2844367
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0TGuUSV5XSvPI1Dd46vwu0Gs
	nPiDPUv/PqFpk/6rYNU=; b=D3HkjXy3W10L1qlo+hyEmhVwRgOk3zPtQqTzh9uE
	M1oy+ZWsMKYlZtTuKh90FT4wnPX70amVLGsqSYJSKCPLFrfNPYRGNwWSmxSfs88w
	AgsQhCOIQrO5uc7K7mvQknbPZ0dZPsD3OJ0tWxz33p3URmz/otBXB9emU/mvAoh4
	/KOpgbZMnt7ufWVbzqtTNGLl4BQgJ+0GB9Szas71vaRSKYcyanCUAAu8nrGuB3HZ
	kkG2tzf8KNNvri9WjJ6O4ySPA8gKdTJ6XqiaFRLt7W9dQLVPGaMIJIiI84lat9rh
	LKvkkhMSf9ivxuHo6VDeh54XnMTi/Z8ybZkgENOhHExwKw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k2cb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:32:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a7af8b94so1516757eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795451551; x=1796056351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TGuUSV5XSvPI1Dd46vwu0GsnPiDPUv/PqFpk/6rYNU=;
        b=QfpG2JD1Ghkj6EsUNcejcnPofkG+n40449kVAJ62FaCprPU6l7+Zr3riy1z9Urh/if
         MtyqHdpswPUFdnxqN5FSkf1pHpVdS74UmnMjwPvKXtalDyY6HC+A1D/H6wQ2iACk9kaD
         Ri/ZsxOnjyQBs6/DW5A4hhhjVXGTqG4mQ52rqeUgSpvEAvzcdXd6eMTVG7gO3DNiPreT
         wmQ/iQAKH0s9uRAacpTYg2wvVjOCeX0rRGuFZW7Ax1BbsHbT4oygypmjNaAbcLP6pD/+
         6TxbvBKOWQnu4c4dXXsdDduDOPc96qU/N0y3r3P1IsRukSHLc5uRD1E3pD/nqlqCIiNF
         QZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451551; x=1796056351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TGuUSV5XSvPI1Dd46vwu0GsnPiDPUv/PqFpk/6rYNU=;
        b=aLIoejZQIiDeBrbmdJ41OliBsrWcS+kg9rZivtyF8bP6xcILgBQhI72IkNjc3ujt4G
         HUPQdzs4oFWvwzTw2ybUa88CIoM2E/OfwpUcVrKbFy/gXaE2j5JEmidseHzGrYD7/HJs
         lxBSr8amDtkDfM7LlVGFx35PBBGhte/jVWUanvj+CUr5dVLkKOfXgg6GvU5po7kjTQsM
         X0ykfNlcbZhfrctisHV6VLnHZULpbs1ALqAfMPd0jGNWQUiNgufxyI7RM1tnwdv1JXDh
         fWJPOEG+ihC5Z53q6xBJxyzpX+J2plIybTX1irRnzlJGu0uZVn6rOlFAVmgUkxxoIE9r
         6qog==
X-Forwarded-Encrypted: i=1; AL+hErG7orqgsZ+1z4D8EFuk3tm7cbXVHaW1ySuB5fWRqCt2uM9sKsygpfg4kfJOpit0aqwKhi2RUIhoIWL8@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tqw7x5LCtd0hjprvJC1zevdP7Xy++Jy8OLhSVc6xLfZ5Zxfey
	lmoBX5uIliLTdPXsxZ9XNDO3ASNnE/5A3YL3lOwgPgswO7zvzHNGryB8Hd/i7Z92tzILLkD+Gjj
	sq4mkr/275S2pOI4Sz9+Hm4CRQgicZ2rzHumv0Yww3bHhPpBH3Ux1RwntQnC7qlOC
X-Gm-Gg: AZFdTZcEJ9wKzCDUCjwAvsPNZyVgPVxzNMjuB+PiWzsdergW15NHJVhVOvwxnYNdm5X
	MrBReAyg8oe7D6SrWH83YKKpMAFtQnPqWiYLwFqVy67hnLo0ssQZrVP34XF/NRT6qNpSoZYwI2O
	4zoE6Lqk5z2H+0D7dBmxnKvNLrNtmzyXP94n+KUV7o0CkBeCKa0+fSEY9hi+Q4F6n8w2fqet316
	GKo9BzU9MlIBLHtX4UwZmCN86TMJNvVblJh0CKw77l5ew6fhSy39yqKy3yEuUkUq1T7gzhHJY67
	9xe5QaNgO5xDdT1YvLzKDJP4Zqi9J2u6xXyBo9Uk9f5LHTSdJ/Spkwy1O/mWjuZUn7yqzhkX2Br
	ObCfOzprpqpVsg5G5Cap6aKhQaxv7sMqIGNr6Yt0FTFgWwWgbiEL5PBCL8aFIEcshFy+5rbZoHk
	OX
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr12572064eec.36.1795451551199;
        Mon, 23 Nov 2026 08:32:31 -0800 (PST)
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr12572034eec.36.1795451550583;
        Mon, 23 Nov 2026 08:32:30 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm3867956eec.9.2026.11.23.08.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:32:30 -0800 (PST)
Date: Mon, 23 Nov 2026 22:02:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm6375: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261123163221.sau7phw43zc2mo7q@hu-mojha-hyd.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-3-3e868b4bfa48@oss.qualcomm.com>
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
In-Reply-To: <20261123-rpm-memory-non-wc-v2-3-3e868b4bfa48@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfXzBD1IH9ZsCXA
 ClV7Rcy/+4LM4OofUZ/qu4PSVhUGLttZe9n/0gVdI440N39iFwrF4SOSmVxUpfICAbahm7qn6By
 s0URDyXllr/rSwdwvy0iLxzK357oUfM=
X-Proofpoint-GUID: MsabXQSGG3h7NTudAk8BjkQhHircdlAo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX3dde+oL6ybOB
 soXJGZm5raYuQ/GF3GIsjVGXEy9fSA3SsneRV4NRLtbDvlez+xow2UxLJ0amnUkgFDP3RH4nt7b
 5Q40+9uDulcVel1+pURm3f695c2z/+jXfkpuOWOGYl53rlGbQSB1sliELd5G2y1WqDopZvpgcXc
 SwaMGECeC1rd/53FeFC5DBD7LDdATbInD4MCK15GKpgSL1TGHP4KGhgzVISGMXny0rDO6K8v6ye
 Zc967uz3vcYQDhn93lGpu4P85UPF1cbsFdW8blk9FSWu3EQrmRwV0X6o3dRLdBthP2hrZ1/y3yO
 CePTBwb0R7oEm5t14+QWcuiaJoPjTFSR5OUIevdvEf08XMh5WAVoqtH5Qf68YW2JZu5M8eo3NF9
 oZzVgivKPPSJoekG/yeyDCe5CRON3KoFxIboLjfyetVEa/L4eyNYoClSTqnXIvMLIHrPlg636jC
 PnnZPWQFJ0tJAIp2XNg==
X-Proofpoint-ORIG-GUID: MsabXQSGG3h7NTudAk8BjkQhHircdlAo
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b046aa0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wLgbqfl3iQV84jYfjRYA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230065

On Mon, Nov 23, 2026 at 11:48:58AM +0530, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts.
> 
> When Linux runs at EL2 (KVM with VHE), there is no stage-2 translation
> and the write-combined mapping takes effect, so such reads can result
> in XPU violations. When Linux runs at EL1 under a hypervisor such as
> Gunyah, a Device mapping of the region at stage-2 hides the issue, as
> the stricter memory type applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: d3246a0cf43f ("arm64: dts: qcom: sm6375: Hook up MPM")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
 
-- 
-Mukesh Ojha
